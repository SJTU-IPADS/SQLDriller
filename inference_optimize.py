import argparse
import json
import os

import sqlglot
from sqlglot.expressions import Literal

from dataset_refine import get_pred_exec_results, ask_gpt_for_exec_res, get_pred_scores, log_exec_ce
from third_party.ce_gen.utils import exec_eval as EXEC_EVAL
from utils.constants import *
from utils.path_utils import METADATA_FILE_PATHS, TABLE_FILE, SCHEMA_DB_DIR, SCHEMA_FILE_DIR
from utils.sql_utils import order_matters, is_valid_sql, get_schema_ddl
from utils.sqlite_utils import exec_on_db_
from utils.utils import check_equivalence, simplify_ce


def get_limit_k(sql):
    try:
        parsed_sql = sqlglot.parse(sql, read='sqlite')[0]
        if 'limit' in parsed_sql.args.keys() and parsed_sql.args['limit'] is not None:
            limit_exp = parsed_sql.args['limit'].expression
            if type(limit_exp) is Literal:
                return int(limit_exp.name)
        return 0
    except:
        return False


def select_prediction(item, args) -> str:
    case_id, db_id, nlq = item['id'], item['db_id'], item['nlq']
    evidence = item['evidence'] if 'evidence' in item.keys() else None

    schema_db_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.gold_checked][SCHEMA_DB_DIR]
    schema_file_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.gold_checked][SCHEMA_FILE_DIR]
    schema_ddl = get_schema_ddl(db_id, schema_file_dir)

    infer_predictions_unchecked = list(set(item["infer_predictions"][0]))
    infer_predictions = [sql for sql in infer_predictions_unchecked
                         if is_valid_sql(sql, db_id, schema_db_dir) and get_limit_k(sql) < 10]

    order_matters_option = sum([1 for pred in infer_predictions if order_matters(pred)]) >= len(infer_predictions) / 2
    # There are multiple predictions with the same score, we want to pick one from them
    candidate_preds = infer_predictions
    candidate_pred_ce_paths = []
    replaced_gold = None
    for i in range(len(candidate_preds)):
        for j in range(i + 1, len(candidate_preds)):
            pred1 = candidate_preds[i]
            pred2 = candidate_preds[j]
            already_has_ce = False
            for ce_path in candidate_pred_ce_paths:
                _, infer_pred1_res = exec_on_db_(ce_path, pred1)
                _, infer_pred2_res = exec_on_db_(ce_path, pred2)

                if not EXEC_EVAL.result_eq(infer_pred1_res, infer_pred2_res, order_matters=order_matters_option):
                    already_has_ce = True
                    break
            if already_has_ce:
                continue

            eq_tag, ce_path = check_equivalence(pred1, pred2, schema_ddl, schema_db_dir, None, db_id, args.sql_equiv_mode, args.benchmark,
                                                CEA=True, case_id=case_id, cea_path=args.counterexample_db_dir)
            if eq_tag == EQ_TAG or eq_tag == EMPTY_TAG:
                continue
            assert ce_path is not None
            simplified_ce_path = simplify_ce(ce_path, pred1, pred2, case_id, args.save_ce_dir)
            if simplified_ce_path is not None:
                candidate_pred_ce_paths.append(simplified_ce_path)
    if len(candidate_pred_ce_paths) != 0:
        candidate_pred_ce_res_list = get_pred_exec_results(candidate_preds, candidate_pred_ce_paths)

        gpt_log_dir = os.path.join(args.save_dir, "exec_res", str(case_id))
        gpt_ce_res = ask_gpt_for_exec_res(nlq, candidate_preds,
                                          db_id, schema_db_dir, candidate_pred_ce_paths, gpt_log_dir,
                                          order_matters_option=order_matters_option,
                                          column_slim_option=(args.benchmark == benchmark_type.bird),
                                          evidence=evidence)
        candidate_pred_scores = get_pred_scores(candidate_preds, candidate_pred_ce_paths,
                                                candidate_pred_ce_res_list,
                                                gpt_ce_res, order_matters_option)
        max_indexes = [i for i, x in enumerate(candidate_pred_scores) if x == max(candidate_pred_scores)]
        replaced_gold = None
        if not order_matters_option:
            for max_index in max_indexes:
                if not order_matters(candidate_preds[max_index]):
                    replaced_gold = candidate_preds[max_index]
                    break
        if replaced_gold is None:
            replaced_gold = candidate_preds[max_indexes[0]]

        log_exec_ce(gpt_log_dir,
                    gpt_ce_res,
                    candidate_pred_ce_paths,
                    candidate_preds,
                    candidate_pred_ce_res_list,
                    candidate_pred_scores)
    elif len(infer_predictions) != 0:
        if not order_matters_option:
            for pred in infer_predictions:
                if not order_matters(pred):
                    replaced_gold = pred
                    break
        if replaced_gold is None:
            replaced_gold = infer_predictions[0]
    else:
        replaced_gold = "sql placeholder"
    assert replaced_gold is not None

    return replaced_gold


def main(args):
    with open(args.test_dataset_file_path) as f:
        test_set = json.load(f)
    with open(args.sql_candidates_path) as f:
        candidate_prediction_items = json.load(f)

    if not os.path.exists(args.save_dir):
        os.makedirs(args.save_dir)

    for item in candidate_prediction_items:
        case_id = item['id']
        if (args.start_id >= 0 and case_id < args.start_id) or (args.end_id >= 0 and case_id > args.end_id):
            continue

        print("Check model inferences for case %d" % case_id)

        pred = select_prediction(item, args)
        # 'result%s_%s.sql' % (args.start_id, args.end_id)
        with open(os.path.join(args.save_dir, args.inference_result_save_file), "a") as f:
            f.write(pred + "\n")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--test_dataset_file_path", type=str, required=True)
    parser.add_argument("--sql_candidates_path", type=str, required=True)
    parser.add_argument("--counterexample_db_dir", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.test)
    parser.add_argument("--sql_equiv_mode", type=str, default=sql_equiv_mode.mixed)

    parser.add_argument("--save_dir", type=str, required=True)
    parser.add_argument("--save_ce_dir", type=str, required=True)
    parser.add_argument("--inference_result_save_file", type=str, default="result.sql")

    parser.add_argument("--start_id", type=int, default=-1)
    parser.add_argument("--end_id", type=int, default=-1)

    args = parser.parse_args()

    for path_key in vars(args).keys():
        if path_key in ["test_dataset_file_path", "sql_candidates_path", "counterexample_db_dir"]:
            if not os.path.exists(vars(args)[path_key]):
                print(f"args.{path_key}: `{vars(args)[path_key]}` does not exist. Please check carefully.")
                exit(1)

    os.makedirs(args.save_dir, exist_ok=True)
    os.makedirs(args.save_ce_dir, exist_ok=True)

    main(args)
    
