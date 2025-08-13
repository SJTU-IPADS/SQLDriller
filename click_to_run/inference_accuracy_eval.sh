original_train_tag="original_train"
refined_train_tag="refined_train"
opt_SQLDriller_tag="opt_SQLDriller"
opt_llmconsis_tag="opt_llmconsis"

for model_name in 'dail' 'din' 'resd' 'graphix-T5' 'sftcodes' 'codes'; do
    if [[ "$model_name" == "dail" || "$model_name" == "din" || "$model_name" == "resd" || "$model_name" == "graphix-T5"]]; then
        benchmark="spider"
        dataset_type="test"
    elif [[ "$model_name" == "sftcodes" || "$model_name" == "codes" ]]; then
        benchmark="bird"
        dataset_type="dev"

    accuracy_result_dir="results/inference/${model_name}"
    sql_file_original_train="./prepared/${benchmark}/accuracy/pred/${dataset_type}/pred_original_train/${model_name}.sql"
    sql_file_refined_train="./prepared/${benchmark}/accuracy/pred/${dataset_type}/pred_refined_train/${model_name}.sql"

    # step 1: copy files, get 4 files for each model's dir
    cp sql_file_original_train "${accuracy_result_dir}/${model_name}_${original_train_tag}.sql"
    cp sql_file_refined_train "${accuracy_result_dir}/${model_name}_${refined_train_tag}.sql"

    file_count=$(ls ${accuracy_result_dir}/*.sql 2>/dev/null | wc -l)
    if [ ${model_name} -ne 'graphix-T5' && ${file_count} -ne 4 ]; then
        echo "Error: Expected 4 '.sql' files in ${accuracy_result_dir}, but found ${file_count}."
        exit 1
    fi

    # step 2: enter and invoke ./third_party/test-suite-accuracy/, use Test-Suite-Accuracy to evaluate model accuracy.
    gold_file="data/${benchmark}/opt/${dataset_type}_gold.sql"
    metadata_file="data/${benchmark}/opt/${dataset_type}.json"
    db_dir="dbs/fuzz/${benchmark}/${dataset_type}/accuracy_eval"
    for version_tag in ${original_train_tag} ${refined_train_tag} ${opt_SQLDriller_tag} ${opt_llmconsis_tag}; do
        sql_file="${accuracy_result_dir}/${model_name}_${version_tag}.sql"
        export CURRENT_PATH=$(pwd)
        cd "./third_party/test-suite-accuracy"
        python evaluation.py \
            --gold "${CURRENT_PATH}/${gold_file}" \
            --pred "${CURRENT_PATH}/${sql_file}" \
            --metadata "${CURRENT_PATH}/${metadata_file}" \
            --db "${CURRENT_PATH}/${db_dir}" \
            --etype exec \
            --keep_distinct \
            > "${CURRENT_PATH}/${accuracy_result_dir}/${model_name}_${version_tag}.tsv"

        cd ${CURRENT_PATH}
    done
done

# step 3: calculate accuracy improvement numbers: formulate a table, draw a figure
output_stat_dir="./results/inference/"
python inference_accuracy_eval.py \
    --save_dir ${output_stat_dir}


echo "[Done] Results are saved in ${output_stat_dir} ."
