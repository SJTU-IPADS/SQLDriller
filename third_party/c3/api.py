import json, os

from utils.constants import dataset_type
import globals
from .src.generate_sqls_by_gpt import get_sql
from .path_utils import C3_SPIDER_FILE_PATHS, C3_dev_file, C3_train_file, C3_test_file, C3_train_cache_cases, C3_dev_cache_cases, C3_test_cache_cases


def generate_gpt_sql_answers(dataset: str, item: dict, count: int) -> list:
    case_id = item['id']

    if dataset == dataset_type.train:
        cache_cases_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_train_cache_cases]
    elif dataset == dataset_type.dev:
        cache_cases_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_dev_cache_cases]
    elif dataset == dataset_type.test:
        cache_cases_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_test_cache_cases]

    if os.path.exists(cache_cases_file):
        with open(cache_cases_file) as f:
            cache_cases = json.load(f)
            for cache_case in cache_cases:
                if cache_case['id'] == case_id:
                    return cache_case['initial_predictions'] if dataset == dataset_type.train \
                           else cache_case['infer_predictions'][0]

    if dataset == dataset_type.train:
        C3_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_train_file]
    elif dataset == dataset_type.dev:
        C3_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_dev_file]
    elif dataset == dataset_type.test:
        C3_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_test_file]
    with open(C3_file) as f:
        C3_data = json.load(f)
    C3_item = C3_data[case_id]
    if C3_item['id'] != case_id:
        for itm in C3_data:
            if itm['id'] == case_id:
                C3_item = itm
                break
    return get_sql(C3_item, count)


def get_schema_info(dataset: str, case_id: int, db_id: str) -> str:
    if dataset == dataset_type.train:
        C3_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_train_file]
    elif dataset == dataset_type.dev:
        C3_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_dev_file]
    elif dataset == dataset_type.test:
        C3_file = C3_SPIDER_FILE_PATHS[globals.CURRENT_REFINE_STEP][C3_test_file]


    with open(C3_file) as f:
        C3_data = json.load(f)
    C3_item = C3_data[case_id]
    if C3_item['id'] != case_id:
        for itm in C3_data:
            if itm['id'] == case_id:
                C3_item = itm
                break

    schema = ''
    for tab, cols in C3_item['schema'].items():
        schema += '' + tab + ' ( '
        for i, col in enumerate(cols):
            schema += col
            if C3_item['db_contents'][tab][i]:
                schema += '("'
                for value in C3_item['db_contents'][tab][i]:
                    schema += value + '", "'
                schema = schema[:-4] + '")'
            schema += ', '
        schema = schema[:-2] + ' )\n'
    schema = schema[:-1]
    for fk in C3_item['fk']:
        schema += '\n' + fk
    return schema

