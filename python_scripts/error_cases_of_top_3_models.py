DAIL_res_path_baseline = "prepared/testsuite_evaluation/result_dev_gold_fixed/DAIL-SQL_baseline.tsv"
DAIL_res_path_refined = "prepared/testsuite_evaluation/result_dev_gold_fixed/DAIL-SQL_SQLDRILLER.tsv"

RESD_res_path_baseline = "prepared/testsuite_evaluation/result_dev_gold_fixed/RESD3b_baseline.tsv"
RESD_res_path_refined = "prepared/testsuite_evaluation/result_dev_gold_fixed/RESD3b_SQLDRILLER.tsv"

DIN_res_path_baseline = "prepared/testsuite_evaluation/result_dev_nlq_checked/result_exec_DINSQL_original_nlq.tsv"

with open(DAIL_res_path_baseline, 'r') as f:
    DAIL_baseline = f.readlines()[:1034]
    DAIL_baseline_tags = [int(line.split('\t')[0]) for line in DAIL_baseline]

with open(DAIL_res_path_refined, 'r') as f:
    DAIL_refined = f.readlines()[:1034]
    DAIL_refined_tags = [int(line.split('\t')[0]) for line in DAIL_refined]

# RESD the same way
with open(RESD_res_path_baseline, 'r') as f:
    RESD_baseline = f.readlines()[:1034]
    RESD_baseline_tags = [int(line.split('\t')[0]) for line in RESD_baseline]

with open(RESD_res_path_refined, 'r') as f:
    RESD_refined = f.readlines()[:1034]
    RESD_refined_tags = [int(line.split('\t')[0]) for line in RESD_refined]

# DIN-SQL the same way
with open(DIN_res_path_baseline, 'r') as f:
    DIN_SQL_baseline = f.readlines()[:1034]
    DIN_SQL_baseline_tags = [int(line.split('\t')[0]) for line in DIN_SQL_baseline]

if __name__ == "__main__":
    DAIL_SQL_error_cases_baseline = []
    DAIL_SQL_improved_cases = []
    for i in range(len(DAIL_baseline_tags)):
        if DAIL_baseline_tags[i] == 0:
            DAIL_SQL_error_cases_baseline.append(i)
            if DAIL_refined_tags[i] == 1:
                DAIL_SQL_improved_cases.append(i)

    RESD_error_cases_baseline = []
    RESD_improved_cases = []
    for i in range(len(RESD_baseline_tags)):
        if RESD_baseline_tags[i] == 0:
            RESD_error_cases_baseline.append(i)
            if RESD_refined_tags[i] == 1:
                RESD_improved_cases.append(i)

    DIN_SQL_error_cases_baseline = [i for i in range(len(DIN_SQL_baseline_tags)) if DIN_SQL_baseline_tags[i] == 0]

    print("\033[91mError cases of 3 top-ranking models:\033[0m")
    error_cases_3_top_ranking_models = sorted(list(set(DAIL_SQL_error_cases_baseline) & set(RESD_error_cases_baseline) & set(DIN_SQL_error_cases_baseline)))
    print(", ".join(str(item) for item in error_cases_3_top_ranking_models))

    print("\033[91mCases that can be fixed after fixing the training set:\033[0m")
    fix_cases = sorted(list(set(DAIL_SQL_improved_cases) & set(RESD_improved_cases) & set(DIN_SQL_error_cases_baseline)))
    print(", ".join(str(item) for item in fix_cases))
