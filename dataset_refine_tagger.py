import argparse
import json, os
import pandas as pd
from tqdm import tqdm

import globals
from python_scripts.utils.stat_utils import is_correct_case
from utils.constants import *
from utils.utils import check_equivalence


def evaluate(args):
    groundtruth_list = pd.read_csv(args.groundtruth_file_path, sep='\t',
                                   usecols=['case_id', 'db_id', 'nlq', 'original gold', 'original gold tag', 'final fixed gold']
                                   ).to_dict(orient='records')
    groundtruths = {record['case_id']: record for record in groundtruth_list}

    with open(args.input_path, 'r') as f:
        records = f.readlines()
    assert len(records) == len(groundtruths)

    tagged_records = []
    for record in tqdm(records):
        items = record.strip().split('\t')
        case_id, gold, fix = int(items[0]), items[1], items[2]

        # if case_id not in [218, 289]:
        #     continue

        print("Tagging case %d" % case_id)

        db_id = groundtruths[case_id]['db_id']
        gold_tag = groundtruths[case_id]['original gold tag']
        groundtruth_sql = groundtruths[case_id]['final fixed gold']

        if is_correct_case(gold_tag):
            if fix == '-':
                fix_tag = '1'  # deterministic
            else:
                eq_tag, _ = check_equivalence(groundtruth_sql, fix, None, args.fuzz_db_dir, db_id, sql_equiv_mode.exec, args.benchmark)
                if eq_tag == EQ_TAG:
                    fix_tag = '1*'
                elif eq_tag == NEQ_TAG:
                    fix_tag = '1-0'  # deterministic
                else:
                    fix_tag = '1-0*'
        else:
            if fix == '-':
                fix_tag = '0'  # deterministic
            else:
                eq_tag, _ = check_equivalence(groundtruth_sql, fix, None, args.fuzz_db_dir, db_id, sql_equiv_mode.exec, args.benchmark)
                if eq_tag == EQ_TAG:
                    fix_tag = '0-1*'
                elif eq_tag == NEQ_TAG:
                    fix_tag = '0-0'  # deterministic
                else:
                    fix_tag = '0-0*'
        tagged_records.append("%d\t%s\t%s\t%s" % (case_id, gold, fix, fix_tag))

        # print(case_id, fix_tag)
    with open(args.output_path, 'w') as f:
        f.write('\n'.join(tagged_records))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--groundtruth_file_path", type=str, required=True)
    parser.add_argument("--fuzz_db_dir", type=str, required=True)

    parser.add_argument("--input_path", type=str, required=True)
    parser.add_argument("--output_path", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.train)

    args = parser.parse_args()

    globals.set_refine_step(refine_steps.original)

    evaluate(args)
