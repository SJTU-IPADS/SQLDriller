#!/bin/bash

if [ $# -lt 2 ]; then
  echo "No parameters provided. Please specify 2 parameters {benchmark} {dataset_type: train/dev/test}."
  exit 1
fi

benchmark=$1
dataset_type=${2:-train}  # Use second parameter if provided, otherwise default to 'gpt-4o'

# TODO: parallel param
# TODO: change output of dataset_refine.py

if [[ "$benchmark" != "spider" && "$benchmark" != "bird" ]]; then
  echo "Not supported dataset. Please specify 'spider' or 'bird' dataset."
  exit 1

gpt_predictions_path="./prepared/${benchmark}/dataset_refine/sqls/${dataset_type}_data.json"
fuzz_db_dir="./dbs/fuzz/${benchmark}/${dataset_type}"
save_dir="./issues/${benchmark}_${dataset_type}"
save_ce_dir="${save_dir}/ce"

echo "Run dataset refine on ${benchmark} ${dataset_type}."
python dataset_refine.py \
    --gpt_predictions_path ${gpt_predictions_path} \
    --fuzz_db_dir ${fuzz_db_dir} \
    --save_ce_dir ${save_ce_dir} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --sql_equiv_mode "mixed" \
    --save_dir ${save_dir}
