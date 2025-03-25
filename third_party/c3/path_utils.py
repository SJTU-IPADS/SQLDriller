import os
from utils.constants import refine_steps


C3_SPIDER_DATA_DIR = "./third_party/c3/spider_data/"

# keys
C3_dev_file = "C3_dev_file"
C3_test_file = "C3_test_file"
C3_train_file = "C3_train_file"
C3_train_cache_cases = "C3_train_cache_cases"
C3_dev_cache_cases = "C3_dev_cache_cases"
C3_test_cache_cases = "C3_test_cache_cases"

C3_SPIDER_FILE_PATHS = {
    refine_steps.original: {
        C3_dev_file: os.path.join(C3_SPIDER_DATA_DIR, "generate_datasets_nlq_checked/C3_dev.json"),
        C3_train_file: os.path.join(C3_SPIDER_DATA_DIR, "generate_datasets/C3_train.json"),
        C3_test_file: os.path.join(C3_SPIDER_DATA_DIR, "generate_datasets_schema_checked/C3_test.json"),
        C3_train_cache_cases: os.path.join(C3_SPIDER_DATA_DIR, "generate_datasets/cache_cases/train_data.json"),
        C3_dev_cache_cases: os.path.join(C3_SPIDER_DATA_DIR, "generate_datasets_nlq_checked/cache_cases/dev_data.json"),
        C3_test_cache_cases: os.path.join(C3_SPIDER_DATA_DIR, "generate_datasets_schema_checked/cache_cases/test_data.json")
    }
}