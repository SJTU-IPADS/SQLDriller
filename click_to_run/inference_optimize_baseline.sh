#!/bin/bash

if [ $# -lt 3 ]; then
    echo "No parameters provided. Please specify 3 parameters {benchmark} {dataset_type: dev/test} {model_name} ."
    exit 1
fi

benchmark=$1
dataset_type=$2
model_name=$3

if [[ "$dataset_type" != "dev" && "$dataset_type" != "test" ]]; then
    echo "Please specify 'dev' or 'test' dataset for accuracy evaluation."
    exit 1
fi

if [[ "$benchmark" == "spider" ]]; then
    if [[ "$model_name" == "dail" || "$model_name" == "din" || "$model_name" == "resd" ]]; then
        echo "Running inference optimization for model: $model_name"
    elif [[ "$model_name" == "graphix-T5" ]]; then
        echo "graphix-T5 model lacks capability of generating multiple predictions in one inference."
        echo "It does not participate in evaluation on inference accuracy improvements by SQLDriller."
        exit 1
    else
        echo "Not supported model. Please specify 'dail', 'din', 'resd', 'graphix-T5' for benchmark spider."
        exit 1
    fi
    test_dataset_file_path="./data/spider/opt/test.json"
elif [[ "$benchmark" == "bird" ]]; then
    if [[ "$model_name" == "sftcodes" || "$model_name" == "codes" ]]; then
        echo "Running inference optimization for model: $model_name"
    else
        echo "Not supported model. Please specify 'sftcodes', 'codes' for benchmark bird."
        exit 1
    fi
    test_dataset_file_path="./data/bird/opt/dev.json"
else
    echo "Not supported benchmark. Please specify 'spider' or 'bird' benchmark."
    exit 1
fi

sql_candidates_path="./prepared/${benchmark}/accuracy/pred/${dataset_type}/multi_pred/${model_name}_refined_train.json"
save_dir="./results/inference/${model_name}"

python llm_consistency_baseline.py \
    --sql_candidates_path ${sql_candidates_path} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --save_dir ${save_dir} \
    --modified_gold_save_file "${model_name}_opt_llmconsis.sql"

echo "[Done] Results are saved in ${save_dir}/${modified_gold_save_file} ."
