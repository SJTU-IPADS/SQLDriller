import argparse
import datetime
import json, os
import traceback
from tqdm import tqdm
from collections import OrderedDict

import globals
from utils.path_utils import SAVE_ISSUE_DIR
from utils.constants import *
from utils.prompt_utils import encode_schema_and_data_prompt
from utils.sql_utils import order_matters, is_valid_sql, get_schema_ddl
from utils.sqlite_utils import exec_on_db_
from utils.utils import check_equivalence, get_gpt_nl_res_list, pick_majority_result, filter_meaningless_sql, \
    simplify_ce
from third_party.test_suite_sql_eval.utils import exec_eval as EXEC_EVAL


def ask_gpt_for_exec_res(args, nlq: str, db_id: str, sqls: list[str], all_ce_paths: list[str], order_matters_option: bool, benchmark: str, evidence=None) -> list:
    case_dir = os.path.join(args.save_dir, "exec_res", str(globals.CURRENT_CASE_ID))
    if not os.path.exists(case_dir):
        os.makedirs(case_dir)
    gpt_ce_res = []
    for ce_path in all_ce_paths:
        data_info_prompt = encode_schema_and_data_prompt(db_id, sqls, ce_path, benchmark, column_slim=(benchmark == benchmark_type.bird))
        with open(os.path.join(case_dir, "ce.txt"), 'a') as f:
            f.write("-----%s-----\n" % ce_path)
            f.write('%s\n' % data_info_prompt)
        gpt_ce_res_self_consistency, _ = \
            get_gpt_nl_res_list(data_info_prompt, nlq, evidence=evidence, n=(1 if len(all_ce_paths) > 5 else 5))
        gpt_res_majority = pick_majority_result(gpt_ce_res_self_consistency, order_matters=order_matters_option)
        gpt_ce_res.append(gpt_res_majority)

    return gpt_ce_res


def get_pred_exec_results(all_preds: list[str], all_ce_paths: list[str]) -> OrderedDict:
    pred_ce_res_list = OrderedDict()
    for pred in all_preds:
        pred_ce_res = OrderedDict()
        for ce_path in all_ce_paths:
            flag, res = exec_on_db_(ce_path, pred)
            assert flag != 'exception'
            pred_ce_res[ce_path] = res
        pred_ce_res_list[pred] = pred_ce_res
    return pred_ce_res_list


def get_gold_score(all_ce_paths: list[str], gold_ce_res_list, gpt_ce_res, order_matters_option) -> int:
    score = 0
    for i in range(len(gpt_ce_res)):
        if EXEC_EVAL.result_eq(gpt_ce_res[i], gold_ce_res_list[all_ce_paths[i]], order_matters=order_matters_option):
            score += 1
    return score


def get_pred_scores(all_preds: list[str], all_ce_paths: list[str], pred_ce_res_list, gpt_ce_res, order_matters_option) -> list[int]:
    pred_scores = []
    for i in range(len(all_preds)):
        pred = all_preds[i]
        pred_ce_res = pred_ce_res_list[pred]
        score = 0
        for j in range(len(all_ce_paths)):
            if EXEC_EVAL.result_eq(pred_ce_res[all_ce_paths[j]], gpt_ce_res[j], order_matters=order_matters_option):
                score += 1
        pred_scores.append(score)
    return pred_scores


def judge_gold(item, args):
    replaced_gold = None

    case_id, db_id, nlq, gold = item['id'], item['db_id'], item['nlq'], item['gold']
    evidence = item["evidence"] if "evidence" in item else None
    infer_predictions = item['infer_predictions'][0]
    infer_predictions = filter_meaningless_sql(infer_predictions, args.fuzz_db_dir, db_id, args.benchmark)
    order_matters_option = order_matters(gold)
    schema_ddl = get_schema_ddl(db_id, args.benchmark, True)

    all_preds = []
    all_ce_paths = []
    gold_ce_res_list = OrderedDict()
    # Collect counterexamples
    for infer_pred in infer_predictions:
        if infer_pred in all_preds or not is_valid_sql(infer_pred, db_id, args.benchmark):
            continue
        all_preds.append(infer_pred)

        already_has_ce = False
        for ce_path in all_ce_paths:
            infer_pred_flag, infer_pred_res = exec_on_db_(ce_path, infer_pred)
            gold_res = gold_ce_res_list[ce_path]
            if not EXEC_EVAL.result_eq(gold_res, infer_pred_res, order_matters=order_matters_option):
                already_has_ce = True
                break
        if already_has_ce:
            continue

        eq_tag, ce_path = check_equivalence(gold, infer_pred, schema_ddl, args.fuzz_db_dir, db_id, args.sql_equiv_mode, args.benchmark)
        if eq_tag == EQ_TAG or eq_tag == EMPTY_TAG:
            continue
        assert ce_path is not None
        simplified_ce_path = simplify_ce(ce_path, gold, infer_pred, case_id, args.save_ce_dir)
        if simplified_ce_path is not None:
            all_ce_paths.append(simplified_ce_path)
            gold_flag, gold_res = exec_on_db_(simplified_ce_path, gold)
            gold_ce_res_list[simplified_ce_path] = gold_res

    print("# of counterexamples between gold and multiple predictions:", len(all_ce_paths))
    if len(all_ce_paths) == 0:
        return None, 1

    # Collect exec results of gold, predictions, gpt
    pred_ce_res_list = get_pred_exec_results(all_preds, all_ce_paths)

    gpt_ce_res = ask_gpt_for_exec_res(args, nlq, db_id, [gold] + all_preds, all_ce_paths, order_matters_option, args.benchmark, evidence)

    gold_score = get_gold_score(all_ce_paths, gold_ce_res_list, gpt_ce_res, order_matters_option)
    pred_scores = get_pred_scores(all_preds, all_ce_paths, pred_ce_res_list, gpt_ce_res, order_matters_option)
    
    log_exec_ce(args, gpt_ce_res, all_ce_paths, all_preds, pred_ce_res_list, pred_scores, gold, gold_ce_res_list, gold_score)
    exec_consistent = 0 if gold_score < len(all_ce_paths) else 1
    
    if max(pred_scores) > gold_score: 
        max_indexes = [i for i, x in enumerate(pred_scores) if x == max(pred_scores)]
        if len(max_indexes) == 1:
            replaced_gold = all_preds[max_indexes[0]]
        else:
            # There are multiple predictions with the same score, we want to pick one from them
            candidate_preds = [all_preds[i] for i in max_indexes]
            candidate_pred_ce_paths = []
            for i in range(len(candidate_preds)):
                for j in range(i + 1, len(candidate_preds)):
                    pred1 = candidate_preds[i]
                    pred2 = candidate_preds[j]
                    already_has_ce = False
                    for ce_path in candidate_pred_ce_paths:
                        infer_pred1_flag, infer_pred1_res = exec_on_db_(ce_path, pred1)
                        infer_pred2_flag, infer_pred2_res = exec_on_db_(ce_path, pred2)
                        
                        if not EXEC_EVAL.result_eq(infer_pred1_res, infer_pred2_res, order_matters=order_matters_option):
                            already_has_ce = True
                            break
                    if already_has_ce:
                        continue

                    eq_tag, ce_path = check_equivalence(pred1, pred2, schema_ddl, args.fuzz_db_dir, db_id, args.sql_equiv_mode, args.benchmark)
                    if eq_tag == EQ_TAG or eq_tag == EMPTY_TAG:
                        continue
                    assert ce_path is not None
                    simplified_ce_path = simplify_ce(ce_path, pred1, pred2, case_id, args.save_ce_dir)
                    if simplified_ce_path is not None:
                        candidate_pred_ce_paths.append(simplified_ce_path)
            if len(candidate_pred_ce_paths) != 0:
                candidate_pred_ce_res_list = get_pred_exec_results(candidate_preds, candidate_pred_ce_paths)
                gpt_ce_res = ask_gpt_for_exec_res(args, nlq, db_id, candidate_preds, candidate_pred_ce_paths, order_matters_option, args.benchmark, evidence)
                candidate_pred_scores = get_pred_scores(candidate_preds, candidate_pred_ce_paths, candidate_pred_ce_res_list, gpt_ce_res, order_matters_option)
                max_indexes = [i for i, x in enumerate(candidate_pred_scores) if x == max(candidate_pred_scores)]
                if not order_matters_option:
                    for max_index in max_indexes:
                        if not order_matters(candidate_preds[max_index]):
                            replaced_gold = candidate_preds[max_index]
                            break
                if replaced_gold is None:
                    replaced_gold = candidate_preds[max_indexes[0]]

                log_exec_ce(args, gpt_ce_res, candidate_pred_ce_paths, candidate_preds, candidate_pred_ce_res_list, candidate_pred_scores)
            else:
                if not order_matters_option:
                    for max_index in max_indexes:
                        if not order_matters(all_preds[max_index]):
                            replaced_gold = all_preds[max_index]
                            break
                if replaced_gold is None:
                    replaced_gold = all_preds[max_indexes[0]]
            # len(max_indexes) may be greater than 1, ask gpt to choose one?

    return replaced_gold, exec_consistent


def log_exec_ce(args,
                gpt_ce_res: list,
                ce_paths: list[str],
                preds: list[str],
                pred_ce_res_list: dict,
                pred_scores: list[int],
                gold=None,
                gold_ce_res_list=None,
                gold_score=-1):
    case_dir = os.path.join(args.save_dir, "exec_res", str(globals.CURRENT_CASE_ID))
    if not os.path.exists(case_dir):
        os.makedirs(case_dir)
    ce_res_json = []
    gpt_res = {}
    for i in range(len(ce_paths)):
        gpt_res[ce_paths[i]] = [str(row) for row in gpt_ce_res[i]]
    ce_res_json.append(gpt_res)

    task_name = "gold_pred_ce_res" if gold is not None else "pred_ce_res"
    with open(os.path.join(case_dir, task_name + ".json"), "w") as f:
        if gold is not None:
            gold_res = {"gold": gold, "score": gold_score}
            for ce_path in ce_paths:
                gold_res[ce_path] = [str(row) for row in gold_ce_res_list[ce_path]]
            ce_res_json.append(gold_res)
        for i in range(len(preds)):
            pred_ces = {"pred": preds[i], "score": pred_scores[i]}
            for ce_path in ce_paths:
                pred_ces[ce_path] = [str(row) for row in pred_ce_res_list[preds[i]][ce_path]]
            ce_res_json.append(pred_ces)
        json.dump(ce_res_json, f, indent=2)


def evaluate(args):
    with open(args.gpt_predictions_path) as f:
        data_items = json.load(f)

    if not os.path.exists(args.save_dir):
        os.makedirs(args.save_dir)
        os.makedirs(os.path.join(args.save_dir, "exec_res"))

    for _, item in tqdm(enumerate(data_items)):
        case_id, db_id, nlq, gold = item['id'], item['db_id'], item['nlq'], item['gold']
        if (args.start_id >= 0 and case_id < args.start_id) or (args.end_id >= 0 and case_id > args.end_id):
            continue
        globals.CURRENT_CASE_ID = case_id

        print("Check gold error for case %d" % case_id)

        try:
            replaced_gold, exec_consistent_flag = judge_gold(item, args)
        except Exception as e:
            print("Exception in judge gold SQL: ", e)
            traceback.print_exc()
            replaced_gold, exec_consistent_flag = None, 1

        with open(os.path.join(args.save_dir, args.modified_gold_save_file), 'a') as f:
            content = "%d\t%d\t%s\t%s" \
                      % (case_id, exec_consistent_flag, gold, replaced_gold if replaced_gold is not None else "-")
            f.write(content + "\n")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--start_id", type=int, default=-1)
    parser.add_argument("--end_id", type=int, default=-1)

    parser.add_argument("--gpt_predictions_path", type=str, required=True)
    parser.add_argument("--fuzz_db_dir", type=str, required=True)
    parser.add_argument("--save_ce_dir", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.train)
    parser.add_argument("--sql_equiv_mode", type=str, default=sql_equiv_mode.mixed)

    parser.add_argument("--save_dir", type=str, default="run" + datetime.datetime.now().strftime("%Y%m%d-%H:%M"))
    parser.add_argument("--modified_gold_save_file", type=str, default="modified_gold.tsv")
    args = parser.parse_args()

    # TODO: remove global log
    globals.LOG_SUBDIR = args.save_dir
    globals.set_refine_step(refine_steps.original)

    evaluate(args)

