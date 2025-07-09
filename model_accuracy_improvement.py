import argparse
import json
import os

import sqlglot
from sqlglot.expressions import Literal

from dataset_refine import get_pred_exec_results, ask_gpt_for_exec_res, get_pred_scores, log_exec_ce
from third_party.test_suite_sql_eval.utils import exec_eval as EXEC_EVAL
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


def judge_order_matters(infer_predictions: list[str]):
    order_matters_count = 0
    for pred in infer_predictions:
        if order_matters(pred):
            order_matters_count += 1
    return order_matters_count >= len(infer_predictions) / 2


def handle_pred_selection(case_preds, item, args) -> str:
        case_id, db_id, nlq, evidence = item['id'], item['db_id'], item['question'], item['evidence']
        assert case_preds[case_id]["id"] == case_id

        schema_table_file_path = METADATA_FILE_PATHS[args.benchmark][refine_steps.gold_checked][TABLE_FILE]
        schema_db_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.gold_checked][SCHEMA_DB_DIR]
        schema_file_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.gold_checked][SCHEMA_FILE_DIR]
        schema_ddl = get_schema_ddl(db_id, schema_file_dir)

        infer_predictions_unchecked = list(set(case_preds[case_id]["infer_predictions"][0]))
        infer_predictions = [sql for sql in infer_predictions_unchecked if is_valid_sql(sql, db_id, schema_db_dir)]
        infer_predictions = [sql for sql in infer_predictions if get_limit_k(sql) < 10]

        order_matters_option = judge_order_matters(infer_predictions)
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

                eq_tag, ce_path = check_equivalence(pred1, pred2, schema_ddl, schema_db_dir, None, db_id, args.sql_equiv_mode, args.benchmark, args.CEA, case_id, args.cea_path)
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
    with open(args.input_spider_dev_set) as f:
        dev_set = json.load(f)
    with open(args.gpt_predictions_path) as f:
        case_preds = json.load(f)

    if args.start_id >= 0 or args.end_id >= 0:
        if args.start_id == -1:
            dev_set = dev_set[:args.end_id + 1]
        elif args.end_id == -1:
            dev_set = dev_set[args.start_id:]
        else:
            dev_set = dev_set[args.start_id:args.end_id + 1]
    if not os.path.exists(os.path.join(args.save_dir)):
        os.makedirs(os.path.join(args.save_dir))
    for item in dev_set:
        pred = handle_pred_selection(case_preds, item, args)
        with open(os.path.join(args.save_dir, 'result%s_%s.txt' % (args.start_id, args.end_id)), "a") as f:
            f.write(pred + "\n")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    # basic config
    parser.add_argument("--sql_equiv_mode", type=str, default=sql_equiv_mode.mixed)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.dev)
    parser.add_argument("--input_spider_dev_set", type=str, required=True)
    parser.add_argument("--gpt_predictions_path", type=str, required=True)
    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--save_dir", type=str, required=True)
    parser.add_argument("--CEA", type=bool, default=True)
    parser.add_argument("--cea_path", type=str, required=True)

    parser.add_argument("--start_id", type=int, default=-1)
    parser.add_argument("--end_id", type=int, default=-1)

    args = parser.parse_args()

    main(args)
    
