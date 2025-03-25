#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameters provided. Please specify 'spider' or 'bird' dataset."
    exit 1
fi

dataset=$1
gpt_model=${2:-gpt-4o}  # Use second parameter if provided, otherwise default to 'gpt-4o'


if [ "$dataset" = "spider" ]; then
    metadata_path="./data/spider/opt/test.json"
    db_instance_dir="./dbs/microbench/spider/test"
    benchmark="spider"
    dataset_type="test"
    save_dir="./results/nl_exec/${benchmark}_${dataset_type}_${gpt_model}"
elif [ "$dataset" = "bird" ]; then
    metadata_path="./data/bird/opt/dev.json"
    db_instance_dir="./dbs/microbench/bird/dev"
    benchmark="bird"
    dataset_type="dev"
    save_dir="./results/nl_exec/${benchmark}_${dataset_type}_${gpt_model}"
else
    echo "Not supported dataset. Please specify 'spider', 'bird' or 'beaver' dataset."
    exit 1
fi

echo "Run NL execution on db instances of ${dataset} with ${gpt_model} model."

python nl_exec_microbench.py \
    --metadata_path ${metadata_path} \
    --db_instance_dir ${db_instance_dir} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --gpt_model ${gpt_model} \
    --save_dir ${save_dir}

