import collections
import json
import re

import matplotlib.pyplot as plt
import numpy as np
from sql_metadata import Parser

from utils.stat_utils import isNegativeInt, isFloat, sql_normalization


def sql2skeleton(sql: str, db_schema):
    sql = sql_normalization(sql)

    table_names_original, table_dot_column_names_original, column_names_original = [], [], []
    column_names_original.append("*")
    for _, table_name_original in enumerate(db_schema["table_names_original"]):
        table_names_original.append(table_name_original.lower())
        table_dot_column_names_original.append(table_name_original + ".*")
        for column_id_and_name in db_schema["column_names_original"]:
            column_id = column_id_and_name[0]
            column_name_original = column_id_and_name[1]
            table_dot_column_names_original.append(table_name_original.lower() + "." + column_name_original.lower())
            column_names_original.append(column_name_original.lower())

    parsed_sql = Parser(sql)
    new_sql_tokens = []
    try:
        for token in parsed_sql.tokens:
            # mask table names
            if token.value in table_names_original:
                new_sql_tokens.append("_")
            # mask column names
            elif token.value in column_names_original \
                    or token.value in table_dot_column_names_original:
                new_sql_tokens.append("_")
            # mask string values
            elif token.value.startswith("'") and token.value.endswith("'"):
                new_sql_tokens.append("_")
            # mask positive int number
            elif token.value.isdigit():
                new_sql_tokens.append("_")
            # mask negative int number
            elif isNegativeInt(token.value):
                new_sql_tokens.append("_")
            # mask float number
            elif isFloat(token.value):
                new_sql_tokens.append("_")
            else:
                new_sql_tokens.append(token.value.strip())
        sql_skeleton = " ".join(new_sql_tokens)
    except Exception as e:
        sql_skeleton = " ".join([str(token) for token in parsed_sql.sqlparse_tokens])

    # remove JOIN ON keywords
    sql_skeleton = sql_skeleton.replace("on _ = _ and _ = _", "on _ = _")
    sql_skeleton = sql_skeleton.replace("on _ = _ or _ = _", "on _ = _")
    sql_skeleton = sql_skeleton.replace(" on _ = _", "")
    pattern3 = re.compile("_ (?:join _ ?)+")
    sql_skeleton = re.sub(pattern3, "_ ", sql_skeleton)

    # "_ , _ , ..., _" -> "_"
    while ("_ , _" in sql_skeleton):
        sql_skeleton = sql_skeleton.replace("_ , _", "_")

    # remove clauses in WHERE keywords
    ops = ["=", "!=", ">", ">=", "<", "<="]
    for op in ops:
        if "_ {} _".format(op) in sql_skeleton:
            sql_skeleton = sql_skeleton.replace("_ {} _".format(op), "_")
    while ("where _ and _" in sql_skeleton or "where _ or _" in sql_skeleton):
        if "where _ and _" in sql_skeleton:
            sql_skeleton = sql_skeleton.replace("where _ and _", "where _")
        if "where _ or _" in sql_skeleton:
            sql_skeleton = sql_skeleton.replace("where _ or _", "where _")

    # remove additional spaces in the skeleton
    while "  " in sql_skeleton:
        sql_skeleton = sql_skeleton.replace("  ", " ")

    # double check for order by
    split_skeleton = sql_skeleton.split(" ")
    for i in range(2, len(split_skeleton)):
        if split_skeleton[i - 2] == "order" and split_skeleton[i - 1] == "by" and split_skeleton[i] != "_":
            split_skeleton[i] = "_"
    sql_skeleton = " ".join(split_skeleton)

    return sql_skeleton


# def get_pre_skeleton(self, queries=None, schemas=None, mini_set=False):
#     if queries:
#         skeletons = []
#         for query, schema in zip(queries, schemas):
#             skeletons.append(sql2skeleton(query, schema))
#         if mini_set and self.mini_test_index_json:
#             mini_index = self.get_mini_index()
#             skeletons = [skeletons[i] for i in mini_index]
#         return skeletons
#     else:
#         return False


def get_schemas(schema_file_path) -> dict:
    db_id_to_table_json = dict()
    tables_json = json.load(open(schema_file_path, "r"))
    for table_json in tables_json:
        db_id_to_table_json[table_json["db_id"]] = table_json
    return db_id_to_table_json


def cal_similarity(schema_file_path, sql_fix_file_path, isSkeleton):
    def jaccard_similarity(skeleton1, skeleton2):
        tokens1 = skeleton1.strip().split(" ")
        tokens2 = skeleton2.strip().split(" ")
        total = len(tokens1) + len(tokens2)

        def list_to_dict(tokens):
            token_dict = collections.defaultdict(int)
            for t in tokens:
                token_dict[t] += 1
            return token_dict

        token_dict1 = list_to_dict(tokens1)
        token_dict2 = list_to_dict(tokens2)

        intersection = 0
        for t in token_dict1:
            if t in token_dict2:
                intersection += min(token_dict1[t], token_dict2[t])
        union = (len(tokens1) + len(tokens2)) - intersection
        return float(intersection) / union

    with open(sql_fix_file_path, "r") as f1:
        records = json.load(f1)

    schemas = get_schemas(schema_file_path)
    original_skeletons = []
    fixed_skeletons = []
    for i in range(len(records)):
        db_id = records[i]["db_id"]
        original, fixed = records[i]["original"], records[i]["fixed"]
        if fixed is None:
            continue

        if isSkeleton:
            original_skeletons.append(sql2skeleton(original, schemas[db_id]))
            fixed_skeletons.append(sql2skeleton(fixed, schemas[db_id]))
        else:
            original_skeletons.append(original)
            fixed_skeletons.append(fixed)

    res = []
    for i in range(len(original_skeletons)):
        res.append(jaccard_similarity(original_skeletons[i], fixed_skeletons[i]))
    return res


if __name__ == "__main__":
    # parser = argparse.ArgumentParser()
    # parser.add_argument("--schema_file_path", type=str, required=True)
    # parser.add_argument("--sql_pair_file_path", type=str, required=True)
    # parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    # parser.add_argument("--dataset_type", type=str, default=dataset_type.test)
    # args = parser.parse_args()

    spider_schema_file_path = "./data/spider/tables.json"
    spider_sql_fix_file_path = "./data/spider/opt/train_sampled_all.json"
    spider_similarities = cal_similarity(spider_schema_file_path, spider_sql_fix_file_path, False)

    bird_schema_file_path = "./data/bird/tables.json"
    bird_sql_fix_file_path = "./data/bird/opt/train_sampled_all.json"
    bird_similarities = cal_similarity(bird_schema_file_path, bird_sql_fix_file_path, False)

    with open("./results/study/jaccard/stat.txt", "w") as f:
        f.write("Percentage of Spider sampled error train cases where the Jaccard similarity between original and fixed SQLs < 0.5: \n{:f}\n"
                .format(len([i for i in spider_similarities if i < 0.5]) / len(spider_similarities)))
        f.write("Percentage of BIRD sampled error train cases where the Jaccard similarity between original and fixed SQLs < 0.5: \n{:f}\n"
                .format(len([i for i in bird_similarities if i < 0.5]) / len(bird_similarities)))

    hist1, bin_edges1 = np.histogram(spider_similarities, bins=len(spider_similarities))
    cdf1 = np.cumsum(hist1 / sum(hist1))
    plt.plot(bin_edges1[1:], cdf1, color='#696969')

    hist2, bin_edges2 = np.histogram(bird_similarities, bins=len(bird_similarities))
    cdf2 = np.cumsum(hist2 / sum(hist2))
    plt.plot(bin_edges2[1:], cdf2, color='#3342FF')

    colors = {"BIRD": '#3342FF', "Spider": '#696969'}
    handles = [plt.Rectangle((0, 0), 1, 1, color=c, linewidth=6) for c in colors.values()]
    labels = list(colors.keys())
    plt.legend(handles, labels, frameon=False, prop={'size': 21})

    plt.grid(True, linestyle='--')
    plt.xlabel('Jaccard similarity', fontsize=28)
    plt.ylabel('CDF', fontsize=28)
    plt.tick_params(axis='y', labelsize=24)
    plt.tick_params(axis='x', labelsize=24)
    plt.tight_layout()
    plt.savefig("./results/study/jaccard/Figure3:Jaccard-similarity.pdf")
    plt.close()
