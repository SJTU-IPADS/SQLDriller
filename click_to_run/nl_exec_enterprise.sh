#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameters provided. Please specify 1 parameter {llm}."
    exit 1
fi

benchmark='beaver'
gpt_model=${1:-gpt-4o}  # Use second parameter if provided, otherwise default to 'gpt-4o'


metadata_path="./data/beaver/opt/dev_gold_ambiguity.json"
dataset_type="dev"

sql_prediction_path="./prepared/beaver/accuracy/pred/dev/chess.sql"

# Table size 5
db_instance_dir="./dbs/microbench/beaver/dev/"
save_dir="./results/nl_exec/${benchmark}_${dataset_type}_${gpt_model}_table_size_5"

echo "Run NL execution on db instances of ${benchmark} with ${gpt_model} model, table size: 5."
python nl_exec_microbench.py \
    --metadata_path ${metadata_path} \
    --db_instance_dir ${db_instance_dir} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --gpt_model ${gpt_model} \
    --save_dir ${save_dir}

echo "Run SQL execution on db instances of ${benchmark} with ${gpt_model} model, table size: 5."
python nl_exec_microbench_sql.py \
    --metadata_path ${metadata_path} \
    --prediction_path ${sql_prediction_path} \
    --db_instance_dir ${db_instance_dir} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --save_dir ${save_dir}


# Table size 100
db_instance_dir_large_table="./dbs/microbench/beaver/dev_size_100/"
save_dir_large_table="./results/nl_exec/${benchmark}_${dataset_type}_${gpt_model}_table_size_100"

echo "Run NL execution on db instances of ${benchmark} with ${gpt_model} model, table size: 100."
python nl_exec_microbench.py \
    --metadata_path ${metadata_path} \
    --db_instance_dir ${db_instance_dir_large_table} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --gpt_model ${gpt_model} \
    --save_dir ${save_dir_large_table}

echo "Run SQL execution on db instances of ${benchmark} with ${gpt_model} model, table size: 100."
python nl_exec_microbench_sql.py \
    --metadata_path ${metadata_path} \
    --prediction_path ${sql_prediction_path} \
    --db_instance_dir ${db_instance_dir_large_table} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --save_dir ${save_dir_large_table}

echo "[Done] Results are saved in ${save_dir}, and ${save_dir_large_table} for large table size (100)."
