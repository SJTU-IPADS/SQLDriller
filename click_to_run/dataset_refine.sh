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
fi

partition_num=8

dataset_file_path="./data/${benchmark}/raw/${dataset_type}.json"
sql_candidates_path="./prepared/${benchmark}/dataset_refine/sqls/${dataset_type}_candidates.json"
fuzz_db_dir="./dbs/fuzz/${benchmark}/${dataset_type}"
save_dir="./results/dataset_refine/${benchmark}_${dataset_type}/SQLDriller"
save_ce_dir="${save_dir}/ce"
log_dir="${save_dir}/log"

mkdir -p "${save_dir}"
mkdir -p "${save_ce_dir}"
mkdir -p "${log_dir}"

if [ $# -ge 3 ] && [ "$3" == "--resume" ] && [ $# -ge 4 ]; then
    resume_partition_id=$4
    modified_gold_file="${save_dir}/modified_gold_${resume_partition_id}.tsv"

    if [ ! -f "$modified_gold_file" ]; then
        echo "No modified_gold file found for partition $resume_partition_id. Starting from the beginning."
        start_id=-1
    else
        last_id=$(awk -F'\t' 'NF>0{last=$1} END{if(last!=""){print last}else{print -1}}' "$modified_gold_file")
        if [[ "$last_id" =~ ^[0-9]+$ ]] && [ "$last_id" -ge 0 ]; then
            start_id=$((last_id + 1))
        else
            start_id=-1
        fi
    fi

    echo "Resuming partition $resume_partition_id from case id $start_id"
    nohup python dataset_refine.py \
        --partition_num ${partition_num} \
        --partition_id ${resume_partition_id} \
        --dataset_file_path ${dataset_file_path} \
        --sql_candidates_path ${sql_candidates_path} \
        --fuzz_db_dir ${fuzz_db_dir} \
        --benchmark ${benchmark} \
        --dataset_type ${dataset_type} \
        --sql_equiv_mode "mixed" \
        --save_dir ${save_dir} \
        --save_ce_dir ${save_ce_dir} \
        --modified_gold_save_file "modified_gold_${resume_partition_id}.tsv" \
        --modified_dataset_save_file "${dataset_type}_${resume_partition_id}.json" \
        --start_id ${start_id} \
        >>"${log_dir}/log_partition_${resume_partition_id}" 2>&1 &
    echo "[Note] Resume process started for partition $resume_partition_id. Check log at ${log_dir}/log_${resume_partition_id}"
    exit 0
fi


echo "Run SQLDriller dataset refining on ${benchmark} ${dataset_type}."
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
        --modified_gold_save_file "modified_gold_${i}.tsv" \
        --modified_dataset_save_file "${dataset_type}_${i}.json" \
        >"${log_dir}/log_partition_${i}" 2>&1 &
done

echo "[Note] Results will be saved in ${save_dir} after the ${partition_num} processes finish."
