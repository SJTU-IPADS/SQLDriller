import os

from .constants import refine_steps, benchmark_type

SPIDER_DATA_DIR = "./data/spider/"
BIRD_DATA_DIR = "./data/bird/"
BEAVER_DATA_DIR = "./data/beaver/"

SAVE_INFER_DIR = "./infer/"
SAVE_ISSUE_DIR = "./issues/"
SAVE_MICROBENCH_DIR = "./microbench/"

# keys
TABLE_FILE = "table_file"
SCHEMA_DB_DIR = "schema_db_dir"
SCHEMA_FILE_DIR = "schema_file_dir"


METADATA_FILE_PATHS = {
    benchmark_type.spider: {
        refine_steps.original: {
            TABLE_FILE: os.path.join(SPIDER_DATA_DIR, "tables.json"),
            SCHEMA_DB_DIR: os.path.join(SPIDER_DATA_DIR, "db"),
            SCHEMA_FILE_DIR: os.path.join(SPIDER_DATA_DIR, "schemas")
        },
        refine_steps.gold_checked: {
            TABLE_FILE: os.path.join(SPIDER_DATA_DIR, "tables.json"),
            SCHEMA_DB_DIR: os.path.join(SPIDER_DATA_DIR, "db"),
            SCHEMA_FILE_DIR: os.path.join(SPIDER_DATA_DIR, "schemas")
        },
    },
    benchmark_type.bird: {
        refine_steps.original: {
            TABLE_FILE: os.path.join(BIRD_DATA_DIR, "tables.json"),
            SCHEMA_DB_DIR: os.path.join(BIRD_DATA_DIR, "db"),
            SCHEMA_FILE_DIR: os.path.join(BIRD_DATA_DIR, "schemas")
        },
        refine_steps.gold_checked: {
            TABLE_FILE: os.path.join(BIRD_DATA_DIR, "tables.json"),
            SCHEMA_DB_DIR: os.path.join(BIRD_DATA_DIR, "db"),
            SCHEMA_FILE_DIR: os.path.join(BIRD_DATA_DIR, "schemas")
        },
    },
    benchmark_type.beaver: {
        refine_steps.original: {
            TABLE_FILE: os.path.join(BEAVER_DATA_DIR, "tables.json"),
            SCHEMA_DB_DIR: os.path.join(BEAVER_DATA_DIR, "db"),
            SCHEMA_FILE_DIR: os.path.join(BEAVER_DATA_DIR, "schemas")
        },
    }
}