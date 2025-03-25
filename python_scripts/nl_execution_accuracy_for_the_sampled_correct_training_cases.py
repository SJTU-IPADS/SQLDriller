from utils.stat_utils import get_correct_ids
import os
import json

log_path = "prepared/dataset_refine_logs/spider/train"
if __name__ == "__main__":
    train_correct_ids = get_correct_ids("train", True)
    total_number_of_db_instances = 0
    total_number_of_execution_consistency_db_instaces = 0
    for id in train_correct_ids:
        path = os.path.join(log_path, str(id), "gold_pred_ce_res.json")
        if os.path.exists(path):
            with open(path, "r") as f:
                scores = json.load(f)
                # count the # of database instances
                total_number_of_db_instances += len(scores[0])
                # count the # of correct NL execution
                total_number_of_execution_consistency_db_instaces += scores[1]["score"]
    print("# of database instances: %d" % total_number_of_db_instances)
    print("# of correct NL execution: %d" % total_number_of_execution_consistency_db_instaces)
    print("NL execution accuracy: %d%%" % round((total_number_of_execution_consistency_db_instaces / total_number_of_db_instances) * 100))
    