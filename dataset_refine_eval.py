import argparse
import json, os
import pandas as pd
from tqdm import tqdm

from python_scripts.utils.stat_utils import is_correct_case
from utils.constants import *
from utils.path_utils import METADATA_FILE_PATHS, SCHEMA_DB_DIR
from utils.utils import check_equivalence


def preprocess_sampled_cases(args):
    groundtruth_list = pd.read_csv(args.sample_case_reference_file, sep='\t',
                                   usecols=['case_id', 'db_id', 'nlq', 'original gold', 'original gold tag',
                                            'final fixed gold']).to_dict(orient='records')
    groundtruths = {int(record['case_id']): record for record in groundtruth_list}
    sampled_case_ids = groundtruths.keys()

    with open(args.SQLDriller_modified_gold_file, 'r') as f:
        records_SQLDriller = f.readlines()
    with open(args.baseline_modified_gold_file, 'r') as f:
        records_baseline = f.readlines()

    sampled_records_SQLDriller, sampled_records_baseline = [], []
    for record in tqdm(records_SQLDriller):
        items = record.strip().split('\t')
        case_id, exec_consistent_flag, gold, fix = int(items[0]), int(items[1]), items[2], items[3]
        if case_id in sampled_case_ids:
            sampled_records_SQLDriller.append((case_id, exec_consistent_flag, gold, fix))
    for record in tqdm(records_baseline):
        items = record.strip().split('\t')
        case_id, _, gold, fix = int(items[0]), items[1], items[2], items[3]
        if case_id in sampled_case_ids:
            sampled_records_baseline.append((case_id, _, gold, fix))

    # if baseline applies on sampled cases but SQLDriller applies on all, align them. 
    if len(sampled_records_SQLDriller) > len(sampled_records_baseline):
        sampled_ids = [r[0] for r in sampled_records_baseline]
        sampled_records_SQLDriller = [r for r in sampled_records_SQLDriller if r[0] in sampled_ids]

    # assert len(sampled_records_SQLDriller) == len(sampled_records_baseline) == len(groundtruths)
    assert len(sampled_records_SQLDriller) == len(sampled_records_baseline)

    return groundtruths, sampled_records_SQLDriller, sampled_records_baseline


def evaluate_detection(args, groundtruths, sampled_records_SQLDriller):
    correct_num, incorrect_num = 0, 0
    correct_consistent_num, correct_inconsistent_num = 0, 0
    incorrect_consistent_num, incorrect_inconsistent_num = 0, 0

    print(f"Evaluate SQLDriller error detection effectiveness in {args.benchmark} {args.dataset_type} set.")

    for record in tqdm(sampled_records_SQLDriller):
        case_id, exec_consistent_flag, gold, fix = int(record[0]), int(record[1]), record[2], record[3]

        print("  case %d" % case_id)

        gold_tag = groundtruths[case_id]['original gold tag']
        if is_correct_case(gold_tag):
            correct_num += 1
            if exec_consistent_flag == 1:
                correct_consistent_num += 1
            else:
                correct_inconsistent_num += 1
        else:
            incorrect_num += 1
            if exec_consistent_flag == 1:
                incorrect_consistent_num += 1
            else:
                incorrect_inconsistent_num += 1

    with open(args.output_stat_file, 'a') as f:
        f.write("SQLDriller effectiveness on error detection: \n")
        f.write("#Incorrect, \t#Inconsistent\t|\t#Correct, \t#Consistent\n")
        f.write("%d, \t%d (%.2f %%)\t|\t%d, \t%d (%.2f %%) \n\n" %
                (incorrect_num, incorrect_inconsistent_num,
                 (incorrect_inconsistent_num / incorrect_num) * 100.0,
                 correct_num, correct_consistent_num,
                 (correct_consistent_num / correct_num) * 100.0))


def evaluate_fix(args, groundtruths, sampled_records_SQLDriller, sampled_records_baseline):
    def tag(groundtruths, sampled_records, tagged_output_file):
        correct, incorrect = 0, 0
        correct_unfixed_num, correct_fixed_num = 0, 0
        incorrect_unfixed_num, incorrect_fixed_num = 0, 0

        schema_db_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.original][SCHEMA_DB_DIR]

        tagged_records = []
        for record in tqdm(sampled_records):
            case_id, exec_consistent_flag, gold, fix = int(record[0]), int(record[1]), record[2], record[3]

            print("  case %d" % case_id)

            db_id = groundtruths[case_id]['db_id']
            gold_tag = groundtruths[case_id]['original gold tag']
            groundtruth_sql = groundtruths[case_id]['final fixed gold']

            if is_correct_case(gold_tag):
                correct += 1
                if fix == '-':
                    correct_unfixed_num += 1
                    fix_tag = '1'  # deterministic
                else:
                    eq_tag, _ = check_equivalence(groundtruth_sql, fix, None, schema_db_dir, args.fuzz_db_dir, db_id, sql_equiv_mode.exec, args.benchmark)
                    if eq_tag == EQ_TAG:
                        correct_unfixed_num += 1
                        fix_tag = '1*'
                    elif eq_tag == NEQ_TAG:
                        correct_fixed_num += 1
                        fix_tag = '1-0'  # deterministic
                    else:
                        correct_fixed_num += 1
                        fix_tag = '1-0*'
            else:
                incorrect += 1
                if fix == '-':
                    incorrect_unfixed_num += 1
                    fix_tag = '0'  # deterministic
                else:
                    eq_tag, _ = check_equivalence(groundtruth_sql, fix, None, schema_db_dir, args.fuzz_db_dir, db_id, sql_equiv_mode.exec, args.benchmark)
                    if eq_tag == EQ_TAG:
                        incorrect_fixed_num += 1
                        fix_tag = '0-1*'
                    elif eq_tag == NEQ_TAG:
                        incorrect_unfixed_num += 1
                        fix_tag = '0-0'  # deterministic
                    else:
                        incorrect_unfixed_num += 1
                        fix_tag = '0-0*'
            tagged_records.append("%d\t%d\t%s\t%s\t%s" % (case_id, exec_consistent_flag, gold, fix, fix_tag))

        with open(tagged_output_file, 'w') as f:
            f.write('\n'.join(tagged_records))

        return correct, incorrect, \
            correct_unfixed_num, correct_fixed_num, \
            incorrect_unfixed_num, incorrect_fixed_num

    print(f"Evaluate SQLDriller error fixing effectiveness in {args.benchmark} {args.dataset_type} set.")
    root, ext = os.path.splitext(args.SQLDriller_modified_gold_file)
    tagged_output_file_SQLDriller = root + '_tagged' + ext
    correct_num, incorrect_num, \
        correct_unfixed_num_SQLDriller, correct_fixed_num_SQLDriller, \
        incorrect_unfixed_num_SQLDriller, incorrect_fixed_num_SQLDriller \
        = tag(groundtruths, sampled_records_SQLDriller, tagged_output_file_SQLDriller)

    print(f"Evaluate LLM-Consistency baseline error fixing effectiveness in {args.benchmark} {args.dataset_type} set.")
    root, ext = os.path.splitext(args.baseline_modified_gold_file)
    tagged_output_file_baseline = root + '_tagged' + ext
    _, _, \
        correct_unfixed_num_baseline, correct_fixed_num_baseline, \
        incorrect_unfixed_num_baseline, incorrect_fixed_num_baseline \
        = tag(groundtruths, sampled_records_baseline, tagged_output_file_baseline)

    with open(args.output_stat_file, 'a') as f:
        f.write("SQLDriller effectiveness on error fixing: \n")
        f.write("#Incorrect, \t#Fixed(SQLDriller), \t#Fixed(baseline)\t|\t"
                "#Correct, \t#Remain unfixed(SQLDriller), \t#Remain unfixed(baseline)\n")
        f.write("%d, \t%d (%.2f %%), \t%d (%.2f %%)\t|\t%d, \t%d (%.2f %%), \t%d (%.2f %%) \n\n" %
                (incorrect_num,
                 incorrect_fixed_num_SQLDriller, (incorrect_fixed_num_SQLDriller / incorrect_num) * 100.0,
                 incorrect_fixed_num_baseline, (incorrect_fixed_num_baseline / incorrect_num) * 100.0,
                 correct_num,
                 correct_unfixed_num_SQLDriller, (correct_unfixed_num_SQLDriller / correct_num) * 100.0,
                 correct_unfixed_num_baseline, (correct_unfixed_num_baseline / correct_num) * 100.0))


def evaluate(args):
    groundtruths, sampled_records_SQLDriller, sampled_records_baseline = preprocess_sampled_cases(args)

    with open(args.output_stat_file, 'w') as f:
        f.write(f"For ({len(groundtruths)} sampled cases from {args.benchmark} {args.dataset_type}): \n")

    evaluate_detection(args, groundtruths, sampled_records_SQLDriller)
    evaluate_fix(args, groundtruths, sampled_records_SQLDriller, sampled_records_baseline)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--sample_case_reference_file", type=str, required=True)
    parser.add_argument("--fuzz_db_dir", type=str, required=True)
    parser.add_argument("--SQLDriller_modified_gold_file", type=str, required=True)
    parser.add_argument("--baseline_modified_gold_file", type=str, required=True)
    parser.add_argument("--output_stat_file", type=str, required=True)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.train)

    args = parser.parse_args()

    for path_key in vars(args).keys():
        if path_key in ["sample_case_reference_file", "fuzz_db_dir", "SQLDriller_modified_gold_file", "baseline_modified_gold_file"]:
            if not os.path.exists(vars(args)[path_key]):
                print(f"args.{path_key}: `{vars(args)[path_key]}` does not exist. Please check carefully.")
                exit(1)

    evaluate(args)
