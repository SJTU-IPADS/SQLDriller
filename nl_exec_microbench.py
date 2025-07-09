import argparse
import datetime
import json
import os
import random

from tqdm import tqdm

from dataset_refine import log_gpt_reply
from utils.llm_utils import GPT_4_TURBO
from utils.path_utils import METADATA_FILE_PATHS, SCHEMA_FILE_DIR, SCHEMA_DB_DIR
from utils.utils import get_gpt_nl_res_list, pick_majority_result
from third_party.test_suite_sql_eval.utils import exec_eval as EXEC_EVAL
from utils.constants import *
from utils.prompt_utils import encode_schema_and_data_prompt
from utils.sql_utils import order_matters
from utils.sqlite_utils import exec_on_db_


def log_nl_exec(save_dir,
                case_id,
                ground_truth_res: list,
                gpt_exec_res: list,
                instance_paths: list[str],
                instance_cnt: int,
                correct_instance_cnt: int,
                res_tags: list[int]):
    case_dir = os.path.join(save_dir, "exec_res", str(case_id))
    if not os.path.exists(case_dir):
        os.makedirs(case_dir)

    score = {"total": instance_cnt, "score": correct_instance_cnt, "res_tag": res_tags}
    ground_truth_res_json = {"tag": "ground_truth"}
    for i in range(len(instance_paths)):
        if ground_truth_res[i] is None:
            ground_truth_res_json[instance_paths[i]] = "Data extraction error"
        else:
            ground_truth_res_json[instance_paths[i]] = [str(row) for row in ground_truth_res[i]]

    gpt_res_json = {"tag": "gpt_nl_exec"}
    for i in range(len(instance_paths)):
        if gpt_exec_res[i] is None:
            gpt_res_json[instance_paths[i]] = "Data extraction error"
        else:
            gpt_res_json[instance_paths[i]] = [str(row) for row in gpt_exec_res[i]]

    with open(os.path.join(case_dir, "microbench_exec_res.json"), "w") as f:
        json.dump([score, ground_truth_res_json, gpt_res_json], f, indent=2)


def check_nl_exec_res(args, case_id, schema_db_dir, db_id, nlq, evidence, sqls, order_matters_option):
    instance_cnt = 0
    correct_instance_cnt = 0

    case_dir = os.path.join(args.save_dir, "exec_res", str(case_id))
    if os.path.exists(os.path.join(case_dir, "microbench_exec_res.json")):
        with open(os.path.join(case_dir, "microbench_exec_res.json")) as f:
            stored_data = json.load(f)
            instance_cnt, correct_instance_cnt = stored_data[0]["total"], stored_data[0]["score"]
            return instance_cnt, correct_instance_cnt

    if os.path.isfile(args.db_instance_dir):
        instance_dir = args.db_instance_dir  # Only one given big db instance
        instance_paths = [instance_dir]
    else:
        instance_dir = os.path.join(args.db_instance_dir, str(case_id))
        instance_paths = sorted([os.path.join(instance_dir, db_path) for db_path in os.listdir(instance_dir)])
    instance_cnt += len(instance_paths)

    ground_truth_res_list, nl_exec_res_list = [], []
    res_tags = []
    for i in range(len(instance_paths)):
        print("  Execute instance %s" % i)

        instance_path = instance_paths[i]
        res_tag = 0
        data_info_prompt = ''
        reply_list = []
        try:
            # NL execution
            data_info_prompt = encode_schema_and_data_prompt(db_id, [sqls[0]], schema_db_dir, instance_path)
            gpt_exec_nl_res_list, reply_list = \
                get_gpt_nl_res_list(data_info_prompt, nlq, evidence=evidence, n=args.n, gpt_model=args.gpt_model)
            nl_exec_res = pick_majority_result(gpt_exec_nl_res_list, order_matters=order_matters_option)
            # SQL execution
            res_tag = 0
            ground_truth_res = None
            for sql in sqls:
                flag, ground_truth_res = exec_on_db_(instance_path, sql)
                assert flag != 'exception', 'Invalid execution on ground truth SQL.'
                if nl_exec_res is None or ground_truth_res is None:
                    continue
                if EXEC_EVAL.result_eq(nl_exec_res, ground_truth_res, order_matters_option):
                    res_tag = 1
                    break
            ground_truth_res_list.append(ground_truth_res)
            nl_exec_res_list.append(nl_exec_res)
        except Exception as e:
            print(e)
            ground_truth_res_list.append(None)
            nl_exec_res_list.append(None)
            res_tag = 0
        finally:
            correct_instance_cnt += res_tag
            res_tags.append(res_tag)

            log_prompt = data_info_prompt + "\n\n" + nlq + ("\n\n" + evidence if evidence is not None else "")
            log_dir = os.path.join(args.save_dir, "exec_res", str(case_id))
            log_gpt_reply(log_dir, i, log_prompt, reply_list)

    log_nl_exec(args.save_dir,
                case_id,
                ground_truth_res_list,
                nl_exec_res_list,
                instance_paths,
                instance_cnt,
                correct_instance_cnt,
                res_tags)

    return instance_cnt, correct_instance_cnt


def evaluate(args, seed=0):
    with open(args.metadata_path, "r") as f:
        metadata = json.load(f)

    random.seed(seed)
    random.shuffle(metadata)
    metadata_microbench = sorted(metadata[:args.microbench_size], key=lambda x: x["id"])

    schema_db_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.original][SCHEMA_DB_DIR]

    total_instance_cnt = 0
    total_correct_instance_cnt = 0
    for item in tqdm(metadata_microbench):
        case_id, db_id, nlq = item["id"], item["db_id"], item["question"]
        evidence = item["evidence"] if "evidence" in item else None
        sqls = item["SQL"] if "SQL" in item else item["query"]
        if type(sqls) is not list:
            sqls = [sqls]
        order_matters_option = order_matters(sqls[0])

        print("Evaluating case %s" % case_id)

        ce_cnt_case, correct_exec_cnt_case = \
            check_nl_exec_res(args, case_id, schema_db_dir, db_id, nlq, evidence, sqls, order_matters_option)
        total_instance_cnt += ce_cnt_case
        total_correct_instance_cnt += correct_exec_cnt_case

    print("Instance count: %d, correctly execute count: %d" % (total_instance_cnt, total_correct_instance_cnt))
    print("Instance exec accuracy on %s %s set: %f" % (args.benchmark, args.dataset_type, total_correct_instance_cnt / total_instance_cnt))
    with open(os.path.join(args.save_dir, "nl_exec_accuracy.txt"), "w") as f:
        f.write("Instance count: %d, correctly execute count: %d\n" % (total_instance_cnt, total_correct_instance_cnt))
        f.write("Instance exec accuracy on %s %s set: %f\n" % (args.benchmark, args.dataset_type, total_correct_instance_cnt / total_instance_cnt))

    return total_correct_instance_cnt / total_instance_cnt


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--metadata_path", type=str, required=True)
    parser.add_argument("--db_instance_dir", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.test)
    parser.add_argument("--microbench_size", type=int, default=100)
    parser.add_argument("--gpt_model", type=str, default=GPT_4_TURBO)
    parser.add_argument("--n", type=int, default=5)

    parser.add_argument("--save_dir", type=str, required=True)
    args = parser.parse_args()

    if not os.path.exists(args.save_dir):
        os.makedirs(args.save_dir)

    evaluate(args)
