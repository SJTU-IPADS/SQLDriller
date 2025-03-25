dataset_type=""
train_preds_file="infer/spider_train_C3_predictions_origin_gpt4/infer_data.json"
dev_preds_file="infer/spider_dev_C3_predictions_nlq_checked_gpt4/infer_data.json"

while [ $# -gt 0 ]; do
    if [ "$1" = "-dataset_type" ]; then
        if [ "$2" = "train" ]; then
            dataset_type="train"
            multiple_preds_file=$train_preds_file
        elif [ "$2" = "dev" ]; then
            dataset_type="dev"
            multiple_preds_file=$dev_preds_file
        fi
        shift 2
    else
        shift 1
    fi
done

python dataset_refine.py --dataset_type $dataset_type --gpt_predictions_path $multiple_preds_file