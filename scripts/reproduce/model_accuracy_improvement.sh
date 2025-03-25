gpt_predictions_path=""
save_subdir=""
save_file=""

while [ $# -gt 0 ]; do
    case "$1" in
    "-gpt_predictions_path")
        gpt_predictions_path=$2
        shift 2
        ;;
    "-save_subdir")
        save_subdir=$2
        shift 2
        ;;
    "-save_file")
        save_file=$2
        shift 2
        ;;
    *)
        shift 1
        ;;
    esac
done

python model_accuracy_improvement.py --gpt_predictions_path $gpt_predictions_path --save_subdir $save_subdir --save_file $save_file