#!/bin/bash

if [ $# -lt 2 ]; then
    echo "No parameters provided. Please specify 2 parameters {benchmark} {dataset_type: train/dev/test}."
    exit 1
fi

benchmark=$1
dataset_type=${2:-train}  # Use second parameter if provided, otherwise default to 'gpt-4o'

# TODO: parallel param

if [[ "$benchmark" != "spider" && "$benchmark" != "bird" ]]; then
    echo "Not supported dataset. Please specify 'spider' or 'bird' dataset."
    exit 1

dataset_file_path="./data/${benchmark}/raw/${dataset_type}.json"
sql_candidates_path="./prepared/${benchmark}/dataset_refine/sqls/${dataset_type}_data.json"
fuzz_db_dir="./dbs/fuzz/${benchmark}/${dataset_type}"
save_dir="./issues/${benchmark}_${dataset_type}"
save_ce_dir="${save_dir}/ce"

echo "Run dataset refine on ${benchmark} ${dataset_type}."
python dataset_refine.py \
    --dataset_file_path ${dataset_file_path} \
    --sql_candidates_path ${sql_candidates_path} \
    --fuzz_db_dir ${fuzz_db_dir} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --sql_equiv_mode "mixed" \
    --save_dir ${save_dir} \
    --save_ce_dir ${save_ce_dir} \
    --modified_gold_save_file "modified_gold" \
    --modified_dataset_save_file "${dataset_type}.json"
