import argparse
import json, os
import datetime

from tqdm import tqdm

from utils.path_utils import SAVE_INFER_DIR
from utils.constants import *
import globals
from utils.utils import get_schema_model_specific_info, get_multiple_predictions_from_model, filter_meaningless_sql


def main(args):
    with open(args.input_spider_dev_set) as f:
        dev_set = json.load(f)

    save_dir_path = os.path.join(SAVE_INFER_DIR, args.save_dir)
    if not os.path.exists(save_dir_path):
        os.makedirs(save_dir_path)
    save_file_path = os.path.join(save_dir_path, args.save_file)

    if args.start_id >= 0 or args.end_id >= 0:
        if args.start_id == -1:
            dev_set = dev_set[:args.end_id + 1]
        elif args.end_id == -1:
            dev_set = dev_set[args.start_id:]
        else:
            dev_set = dev_set[args.start_id:args.end_id + 1]
    if os.path.exists(save_file_path):
        with open(save_file_path, 'r') as f:
            records = json.load(f)
    else:
        records = []
    for _, item in enumerate(tqdm(dev_set)):
        case_id, db_id, nlq, gold = item['id'], item['db_id'], item['question'], item['query']

        schema_model_specific_info = get_schema_model_specific_info(args.pred_gen_model, args.dataset_type, item)
        infer_predictions = []

        trial = 0
        while len(infer_predictions) == 0:
            trial += 1
            if trial > 10:
                infer_predictions = ["sql placeholder"]
                break
            try:
                infer_predictions = get_multiple_predictions_from_model(args.pred_gen_model, args.dataset_type, item,
                                                                        args.max_infer_pred, schema_model_specific_info)
                infer_predictions = filter_meaningless_sql(infer_predictions, args.schema_db_dir, db_id, args.benchmark)
            except Exception as e:
                infer_predictions = []
                if trial > 3:
                    print("Failed to generate predictions for case_id: %d, db_id: %s" % (case_id, db_id))
                    raise e

        record = {'id': case_id, 'db_id': db_id, 'nlq': nlq, 'gold': gold,
                  'infer_predictions': [infer_predictions],  # there may be multiple rounds later, stored in a list
                  }
        records.append(record)

        with open(save_file_path, 'w') as f:
            json.dump(records, f, indent=2)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    # basic config
    parser.add_argument("--max_infer_pred", type=int, default=10)
    parser.add_argument("--schema_db_dir", type=str, required=True)
    parser.add_argument("--pred_gen_model", type=str, default=LLModel.C3)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.dev)
    parser.add_argument("--input_spider_dev_set", type=str, required=True)

    # ./SAVE_INFER_DIR/${save_dir}/${save_file}
    parser.add_argument("--save_dir", type=str, default="run" + datetime.datetime.now().strftime("%Y%m%d-%H:%M"))
    parser.add_argument("--save_file", type=str, default="infer_data.json")

    parser.add_argument("--start_id", type=int, default=-1)
    parser.add_argument("--end_id", type=int, default=-1)

    args = parser.parse_args()

    globals.set_refine_step(refine_steps.original)

    main(args)
