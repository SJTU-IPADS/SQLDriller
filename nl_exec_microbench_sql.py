import argparse
import json
import os
import random

from tqdm import tqdm

from third_party.ce_gen.utils import exec_eval as EXEC_EVAL
from utils.constants import *
from utils.sql_utils import order_matters
from utils.sqlite_utils import exec_on_db_


def evaluate(args, seed=0):
    with open(args.metadata_path, "r") as f:
        metadata = json.load(f)
    with open(args.prediction_path, "r") as f:
        # prediction_data = json.load(f)
        prediction_data = [line.strip() for line in f.readlines()]
    assert len(metadata) == len(prediction_data)

    random.seed(seed)
    random.shuffle(metadata)
    metadata_microbench = sorted(metadata[:args.microbench_size], key=lambda x: x["id"])

    total_instance_cnt = 0
    total_correct_instance_cnt = 0
    for item in tqdm(metadata_microbench):
        case_id, db_id, nlq = item["id"], item["db_id"], item["question"]
        evidence = item["evidence"] if "evidence" in item else None
        sqls = item["SQL"] if "SQL" in item else item["query"]
        if type(sqls) is not list:
            sqls = [sqls]
        order_matters_option = order_matters(sqls[0])

        print("Execute case %d" % case_id)

        if os.path.isfile(args.db_instance_dir):
            instance_dir = args.db_instance_dir  # Only one given big db instance
            instance_paths = [instance_dir]
        else:
            instance_dir = os.path.join(args.db_instance_dir, str(case_id))
            instance_paths = sorted([os.path.join(instance_dir, db_path) for db_path in os.listdir(instance_dir)])
        total_instance_cnt += len(instance_paths)

        # predictions = prediction_data[case_id]["infer_predictions"][0]
        # pred = predictions[0]
        pred = prediction_data[case_id]
        # pred = None
        # for p in predictions:
        #     flag, res = exec_on_db_(instance_paths[0], p)
        #     if flag != 'exception':
        #         pred = p
        #         break
        # if pred is None:
        #     continue

        correct_cnt = 0
        for instance_path in instance_paths:
            for sql in sqls:
                g_flag, g_res = exec_on_db_(instance_path, sql)
                p_flag, p_res = exec_on_db_(instance_path, pred)
                if p_flag == 'exception':
                    break
                if EXEC_EVAL.result_eq(g_res, p_res, order_matters_option):
                    correct_cnt += 1
                    break

        total_correct_instance_cnt += correct_cnt

    print("Instance count: %d, correctly execute count: %d" % (total_instance_cnt, total_correct_instance_cnt))
    print("Instance exec accuracy on %s %s set: %.3f" % (args.benchmark, args.dataset_type, total_correct_instance_cnt / total_instance_cnt))
    with open(os.path.join(args.save_dir, "sql_exec_accuracy.txt"), "w") as f:
        f.write("Instance count: %d, correctly execute count: %d\n" % (total_instance_cnt, total_correct_instance_cnt))
        f.write("Instance exec accuracy on %s %s set: %.3f\n" % (args.benchmark, args.dataset_type, total_correct_instance_cnt / total_instance_cnt))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--metadata_path", type=str, required=True)
    parser.add_argument("--prediction_path", type=str, required=True)
    parser.add_argument("--db_instance_dir", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.test)
    parser.add_argument("--microbench_size", type=int, default=100)

    parser.add_argument("--save_dir", type=str, required=True)
    args = parser.parse_args()

    for path_key in vars(args).keys():
        if path_key in ["metadata_path", "prediction_path", "db_instance_dir"]:
            if not os.path.exists(vars(args)[path_key]):
                print(f"args.{path_key}: `{vars(args)[path_key]}` does not exist. Please check carefully.")
                exit(1)

    os.makedirs(args.save_dir, exist_ok=True)

    evaluate(args)
