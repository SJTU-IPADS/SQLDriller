#!/bin/bash

if [ $# -lt 1 ]; then
    echo "No parameters provided. Please specify 2 parameters {benchmark} {dataset_type: train/dev/test}."
    exit 1
fi

benchmark=$1
dataset_type="train"

if [[ "$benchmark" != "spider" && "$benchmark" != "bird" ]]; then
    echo "Not supported benchmark. Please specify 'spider' or 'bird' benchmark."
    exit 1

groundtruth_file="./prepared/${benchmark}/dataset_refine/stats/${dataset_type}.tsv"
fuzz_db_dir="./dbs/fuzz/${benchmark}/${dataset_type}"
SQLDriller_modified_gold_file="./results/dataset_refine/${benchmark}_${dataset_type}/SQLDriller/modified_gold.tsv"
baseline_modified_gold_file="./results/dataset_refine/${benchmark}_${dataset_type}/LLMConsis_baseline/modified_gold.tsv"
output_stat_file="./results/dataset_refine/${benchmark}_${dataset_type}/statistics.txt"


echo "Evaluate the results of SQLDriller and LLM-consistency baseline on error detection and fixing on ${benchmark} ${dataset_type}."
python dataset_refine_eval.py \
    --groundtruth_file ${groundtruth_file} \
    --fuzz_db_dir ${fuzz_db_dir} \
    --SQLDriller_modified_gold_file ${SQLDriller_modified_gold_file} \
    --baseline_modified_gold_file ${baseline_modified_gold_file} \
    --output_stat_file ${output_stat_file} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type}

echo "[Done] Results are saved in ${output_stat_file} ."
