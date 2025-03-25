from io import FileIO
from utils.stat_utils import get_correct_cases, get_error_cases
import os

def output(f: FileIO, line: list):
    s = "\t".join(str(item) for item in line)
    f.write(s + "\n")
    
def execution_consistency_error_cases(dataset_type: str):
    output_path = "result/error_cases_for_the_%s_set.tsv"
    df = get_error_cases(dataset_type, dataset_type != "dev")
    # case id, db_id, nlq, original gold, original gold exec consistent, SQLDRILLER selected gold, same with human selection / modify according to exec res
    output_path = output_path % dataset_type
    directory = os.path.dirname(output_path)
    if not os.path.exists(directory):
        os.makedirs(directory)
    with open(output_path, "w") as f:
        output(f, ["case id", "db_id", "nlq", "original gold", "original gold exec consistent", "SQLDRILLER selected gold", "same with human selection / modify according to exec res"])
        for i in range(len(df)):
            line = df.iloc[i]
            output(f, [line["case id"], line["db_id"], line["nlq"], line["original gold"], line["original gold exec consistent"], line["SQLDRILLER selected gold"], int(line["same with human selection / modify according to exec res"])])    


def execution_consistency_correct_cases(dataset_type: str):
    output_path = "result/correct_cases_for_the_%s_set.tsv"
    df = get_correct_cases(dataset_type, dataset_type != "dev")
    # case id, db_id, nlq, original gold, original gold exec consistent, SQLDRILLER selected gold, same with human selection / modify according to exec res
    output_path = output_path % dataset_type
    directory = os.path.dirname(output_path)
    if not os.path.exists(directory):
        os.makedirs(directory)
    with open(output_path, "w") as f:
        output(f, ["case id", "db_id", "nlq", "original gold", "original gold exec consistent", "SQLDRILLER selected gold", "same with human selection / modify according to exec res"])
        for i in range(len(df)):
            line = df.iloc[i]
            output(f, [line["case id"], line["db_id"], line["nlq"], line["original gold"], line["original gold exec consistent"], line["SQLDRILLER selected gold"], int(line["same with human selection / modify according to exec res"])])    


if __name__=="__main__":
    execution_consistency_error_cases("train")
    execution_consistency_error_cases("dev")
    execution_consistency_correct_cases("train")
    execution_consistency_correct_cases("dev")