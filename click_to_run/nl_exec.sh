#!/bin/bash

if [ $# -lt 2 ]; then
    echo "No parameters provided. Please specify 2 parameters {benchmark} {llm}."
    exit 1
fi

benchmark=$1
gpt_model=${2:-gpt-4o}  # Use second parameter if provided, otherwise default to 'gpt-4o'

if [ "$benchmark" = "spider" ]; then
    dataset_type="test"
elif [ "$benchmark" = "bird" ]; then
    dataset_type="dev"
else
    echo "Not supported benchmark. Please specify 'spider', 'bird' benchmark."
    exit 1
fi

metadata_path="./data/${benchmark}/opt/${dataset_type}.json"
db_instance_dir="./dbs/microbench/${benchmark}/${dataset_type}"
save_dir="./results/nl_exec/${benchmark}_${dataset_type}_${gpt_model}"

echo "Run NL execution on db instances of ${benchmark} with ${gpt_model} model."
python nl_exec_microbench.py \
    --metadata_path ${metadata_path} \
    --db_instance_dir ${db_instance_dir} \
    --benchmark ${benchmark} \
    --dataset_type ${dataset_type} \
    --gpt_model ${gpt_model} \
    --save_dir ${save_dir}

