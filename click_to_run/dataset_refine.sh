#!/bin/bash

if [ $# -lt 2 ]; then
    echo "No parameters provided. Please specify 2 parameters {benchmark} {dataset_type: train/dev/test}."
    exit 1
fi

benchmark=$1
dataset_type=${2:-train}  # Use second parameter if provided, otherwise default to 'gpt-4o'

if [[ "$benchmark" != "spider" && "$benchmark" != "bird" ]]; then
    echo "Not supported dataset. Please specify 'spider' or 'bird' dataset."
    exit 1

partition_num = 8

dataset_file_path="./data/${benchmark}/raw/${dataset_type}.json"
sql_candidates_path="./prepared/${benchmark}/dataset_refine/sqls/${dataset_type}_data.json"
fuzz_db_dir="./dbs/fuzz/${benchmark}/${dataset_type}"
save_dir="./issues/${benchmark}_${dataset_type}"
save_ce_dir="${save_dir}/ce"

log_dir="${save_dir}/log"

echo "Run dataset refine on ${benchmark} ${dataset_type}."
echo "#process=${partition_num}"
for i in $(seq 0 $((${partition_num}-1))); do
    nohup python dataset_refine.py \
        --partition_num ${partition_num} \
        --partition_id ${i} \
        --dataset_file_path ${dataset_file_path} \
        --sql_candidates_path ${sql_candidates_path} \
        --fuzz_db_dir ${fuzz_db_dir} \
        --benchmark ${benchmark} \
        --dataset_type ${dataset_type} \
        --sql_equiv_mode "mixed" \
        --save_dir ${save_dir} \
        --save_ce_dir ${save_ce_dir} \
        --modified_gold_save_file "modified_gold_${i}" \
        --modified_dataset_save_file "${dataset_type}_${i}.json" \
        >"${log_dir}/log_${i}" 2>&1 &
done
