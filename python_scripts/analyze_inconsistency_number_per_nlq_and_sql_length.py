import json
from typing import Counter, OrderedDict
import matplotlib.pyplot as plt
import numpy as np

from utils.stat_utils import get_df_for_dataset

def compress_and_count(counter, base, upper_bound):
    compressed_counter = Counter()
    for num, count in counter.items():
        compressed_num = ((num + base - 1) // base) * base
        if compressed_num >= upper_bound:
            compressed_counter[upper_bound] += count
            continue

        compressed_counter[compressed_num] += count
    
    return compressed_counter

def get_error_cases_per_nlq_length(modified_ids):
    with open("spider_data/train.json", "r") as f:
        train_cases = json.load(f)
    all_nlqs_length = {}
    all_sqls_length = {}
    for case in train_cases:
        sql_length = len(case["query_toks"])
        nlq_length = len(case["question_toks"])
        if nlq_length in all_nlqs_length:
            all_nlqs_length[nlq_length] += 1
        else:
            all_nlqs_length[nlq_length] = 1
        if sql_length in all_sqls_length:
            all_sqls_length[sql_length] += 1
        else:
            all_sqls_length[sql_length] = 1

    nlqs_length = {}
    sqls_length = {}
    for case_id in modified_ids:
        case = train_cases[case_id]
        sql_length = len(case["query_toks"])
        nlq_length = len(case["question_toks"])
        if nlq_length in nlqs_length:
            nlqs_length[nlq_length] += 1
        else:
            nlqs_length[nlq_length] = 1
        if sql_length in sqls_length:
            sqls_length[sql_length] += 1
        else:
            sqls_length[sql_length] = 1

    nlq_error_ration = {}
    base = 3
    upper_bound = 33
    nlqs_length_compress = compress_and_count(nlqs_length, base, upper_bound)
    all_nlqs_length_compress = compress_and_count(all_nlqs_length, base, upper_bound)
    for nlq_length in nlqs_length_compress:
        error_count = nlqs_length_compress[nlq_length]
        total_count = all_nlqs_length_compress[nlq_length]
        nlq_error_ration[nlq_length] = error_count / total_count

    # for nlq
    nlq_error_ration = OrderedDict(sorted(nlq_error_ration.items()))
    # {x: (# of cases, Inconsistency rate)}
    res = {}
    for x in nlq_error_ration:
        res[x] = [nlqs_length_compress[x], nlq_error_ration[x]]
    plt.plot(nlq_error_ration.keys(), nlq_error_ration.values(), marker='o', color='#3342FF')
    # plt.title("Inconsistency rate of varying natural language token number")
    plt.xlabel(" # of tokens", fontsize=22)
    plt.ylabel("Inconsistency rate", fontsize=22)
    plt.tick_params(axis='x', labelsize=18)
    plt.tick_params(axis='y', labelsize=18)
    plt.xticks(np.arange(6, 39, 6))
    plt.grid(True, linestyle='--')
    plt.tight_layout()
    plt.savefig("./plots/Figure13a:nlq-distribute.pdf")
    plt.close()


    # for sql
    sql_error_ration = {}
    base = 3
    upper_bound = 33
    sqls_length_compress = compress_and_count(sqls_length, base, upper_bound)
    all_sqls_length_compress = compress_and_count(all_sqls_length, base, upper_bound)
    for sql_length in sqls_length_compress:
        error_count = sqls_length_compress[sql_length]
        total_count = all_sqls_length_compress[sql_length]
        sql_error_ration[sql_length] = error_count / total_count
    sql_error_ration = OrderedDict(sorted(sql_error_ration.items()))
    plt.plot(sql_error_ration.keys(), sql_error_ration.values(), marker='o', color='#3342FF')
    # plt.title("Inconsistency rate of varying SQL token number")
    plt.xlabel("# of tokens", fontsize=22)
    plt.ylabel("Inconsistency rate", fontsize=22)
    plt.tick_params(axis='x', labelsize=18)
    plt.tick_params(axis='y', labelsize=18)

    plt.xticks(np.arange(6, 39, 6))
    plt.grid(True, linestyle='--')
    plt.tight_layout()
    plt.savefig("./plots/Figure13b:sql-distribute.pdf")
    plt.close()

def get_training_cases() -> list:
    with open("spider_data/train.json", "r") as f:
        train_cases = json.load(f)
    return train_cases

def get_error_cases_per_schema(modified_ids):
    train_cases = get_training_cases()
    errors_per_schema = {}
    for case_id in modified_ids:
        case = train_cases[case_id]
        if case["db_id"] in errors_per_schema:
            errors_per_schema[case["db_id"]] += 1
        else:
            errors_per_schema[case["db_id"]] = 1

    total_cases_per_schema = {}
    for case in train_cases:
        if case["db_id"] in total_cases_per_schema:
            total_cases_per_schema[case["db_id"]] += 1
        else:
            total_cases_per_schema[case["db_id"]] = 1

    schema_error_ratio = {}
    for schema in total_cases_per_schema:
        error_ratio = errors_per_schema[schema] / total_cases_per_schema[schema] if schema in errors_per_schema else 0
        schema_error_ratio[schema] = error_ratio

    schema_error_ratio_cdf_list = sorted(schema_error_ratio.values())
    cdf = np.arange(1, len(schema_error_ratio_cdf_list) + 1) / len(schema_error_ratio_cdf_list)

    x_smooth = np.linspace(min(schema_error_ratio_cdf_list), max(schema_error_ratio_cdf_list), 10000)
    cdf_smooth = np.interp(x_smooth, schema_error_ratio_cdf_list, cdf)

    # plt.plot(schema_error_ratio_cdf_list, cdf, marker='o', color='#3342FF')
    plt.plot(x_smooth, cdf_smooth, color='#3342FF')
    plt.xlabel("Inconsistency rate", fontsize=16)
    plt.ylabel("CDF", fontsize=16)
    plt.xlim(left=0, right=max(schema_error_ratio.values()))
    plt.ylim(bottom=0, top=1)
    plt.tick_params(axis='x', labelsize=12)
    plt.tick_params(axis='y', labelsize=12)
    plt.grid(True, linestyle='--')
    plt.tight_layout()
    # plt.figure(figsize=(12, 4))
    plt.savefig("./plots/Figure-12:schema-distribute-cdf.pdf")
    plt.close()


if __name__ == "__main__":
    df = get_df_for_dataset("train", False, 0, 7000)
    modified_ids = df[df['SQLDRILLER selected gold'] != "-"]["case id"].tolist()
    get_error_cases_per_nlq_length(modified_ids)
    get_error_cases_per_schema(modified_ids)
