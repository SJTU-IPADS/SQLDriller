#!/bin/bash

if [ $# -lt 2 ]; then
    echo "No parameters provided. Please specify 2 parameters {benchmark} {dataset_type: train/dev/test}."
    exit 1
fi

benchmark=$1
dataset_type=${2:-train}  # Use second parameter if provided, otherwise default to 'train'

if [[ "$benchmark" != "spider" && "$benchmark" != "bird" ]]; then
    echo "Not supported benchmark. Please specify 'spider' or 'bird' benchmark."
    exit 1

# only refine sampled cases for comparison
sql_candidates_path="./prepared/${benchmark}/dataset_refine/sqls/${dataset_type}_data_sampled.json"
sample_case_reference_file="./prepared/${benchmark}/dataset_refine/stats/${dataset_type}.tsv"
save_dir="./results/dataset_refine/${benchmark}_${dataset_type}/LLMConsis_baseline"

echo "Run LLM-consistency dataset refining on ${benchmark} ${dataset_type}."
python llm_consistency_baseline.py \
    --sql_candidates_path ${sql_candidates_path} \
    --contain_gold \
    --sample_case_reference_file ${sample_case_reference_file} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --save_dir ${save_dir} \
    --modified_gold_save_file "modified_gold.tsv"
