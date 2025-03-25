import argparse
import json
import os

import pandas as pd
from tqdm import tqdm

from python_scripts.utils.stat_utils import is_correct_case
from utils.constants import sql_equiv_mode, benchmark_type, EQ_TAG, NEQ_TAG, EMPTY_TAG
from utils.sql_utils import is_valid_sql
from utils.utils import check_equivalence
from utils.constants import refine_steps
import globals


def evaluate(args):
    '''
    This function is used to evaluate the number of groups of candidates by their SQL semantics
    '''
    with open(args.gpt_predictions_path, 'r') as f:
        case_predictions = json.load(f)
    df = pd.read_csv(args.statistic_file_path, sep='\t')
    statistic = dict(zip(df['case_id'].astype(int), df['original gold tag']))

    correct_case_statistics = {}
    incorrect_case_statistics = {}
    maximal_group_number = 0
    for case in tqdm(case_predictions):
        case_id, db_id, candidates, gold = case['id'], case['db_id'], case['infer_predictions'][0], case['gold']
        if (args.start_id >= 0 and case_id < args.start_id) or (args.end_id >= 0 and case_id > args.end_id):
            continue

        print("Processing case:", case_id)

        sql_set = candidates + [gold]
        sql_groups = {}
        # invalid_sql = []
        for sql in sql_set:
            if not is_valid_sql(sql, db_id, args.benchmark):
                # invalid_sql.append(sql)
                continue

            found_group = False
            for group_id, group_sqls in sql_groups.items():
                eq_tag, ce_path = check_equivalence(sql, group_sqls[0], None, args.fuzz_db_dir, db_id, sql_equiv_mode.exec, args.benchmark)
                # if ce_path is not None:
                #     os.unlink(ce_path)

                if eq_tag == EQ_TAG:
                    group_sqls.append(sql)
                    found_group = True
                    break

            if not found_group:
                new_group_id = len(sql_groups)
                sql_groups[new_group_id] = [sql]

        group_number = len(sql_groups)
        # group_number = len(sql_groups) + 1 if len(invalid_sql) > 0 else 0
        if group_number > maximal_group_number:
            maximal_group_number = group_number

        if is_correct_case(statistic[case_id]):
            correct_case_statistics[case_id] = group_number
        else:
            incorrect_case_statistics[case_id] = group_number

        if len(correct_case_statistics) > 0:
            print("{:.2f} groups on average for correct case."
              .format(sum(correct_case_statistics.values()) / len(correct_case_statistics)))
        if len(incorrect_case_statistics) > 0:
            print("{:.2f} groups on average for incorrect case statistics."
              .format(sum(incorrect_case_statistics.values()) / len(incorrect_case_statistics)))
        print("{:.2f} groups on average for all cases."
              .format((sum(correct_case_statistics.values()) + sum(incorrect_case_statistics.values())) /
                      (len(correct_case_statistics) + len(incorrect_case_statistics))))
        print("Maximal number of groups:", maximal_group_number)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    # Use 500 samples to analyze, you can change it into start_id = -1, end_id = -1 to check all cases (too long)
    parser.add_argument("--start_id", type=int, default=0)
    parser.add_argument("--end_id", type=int, default=499)

    parser.add_argument("--gpt_predictions_path", type=str, required=True)
    parser.add_argument("--statistic_file_path", type=str, required=True)
    parser.add_argument("--fuzz_db_dir", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    args = parser.parse_args()

    globals.set_refine_step(refine_steps.original)

    evaluate(args)
