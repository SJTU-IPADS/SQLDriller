# SQLDRILLER
SQLDRILLER is a checker of text-to-sql execution consistency that can automatically discover and fix errors in text-to-sql dataset.

## Update
- `2025.01.23` You can find the appendix PDFs in `./paper/` right now :-) 
- `2024.09.09` Upload paper PDF with appendix of Spider's incorrect cases list.

## CodeBase
This codebase includes the source code and scripts for the paper
*Automated Validation and Fixing of Text-to-SQL Translation with
Execution Consistency*

```shell
.
├── dataset_refine.py                           # Entry file for dataset refine, including schema/nlq/gold fix
├── generate_metadata.py                        # Multiple predictions generation to check the errors in dataset
├── infer                                       # Files including multiple predictions for error check and accuracy improvement
├── issues                                      # Execution result of gpt & sqls on generated counterexamples          
├── logs                                        # Logs of gpt execution
├── prediction_generation_ce_based_offline.py   # Optimization of accuracy by SQLDRILLER
├── scripts                                     # Scripts of data processing, plots, .etc
├── spider_data                                 # Files of spider dataset
├── utils                                       # Utils to process sqlite files and generate prompts
└── third_party                                 # Third party repositories, including different models, sqlsolver, testsuite and verieql.
```


## Environments
### Python Environment
```shell
conda create -n SQLDriller python=3.10
conda activate SQLDriller
python -m pip install --upgrade pip
pip install -r requirements.txt
python nltk_downloader.py
```
### OpenAI Key
**Create a `.env` file** in the root directory of the repository and add the following line to the file:
```
OPENAI_API_KEY = ""
OPENAI_API_BASE = ""
```


## Observations
This section gives the instructions to get the numbers of our observations.
### Numbers In Section 2
- Error rate in sampled train & dev set
```sh
sh scripts/observations/error_rate_in_sampled_cases.sh
```
The corresponding figure is `plots/Figure2:error_per_schema.pdf`.

- Jaccard similarity of original and fixed sqls in the sampled training set:
```sh
sh scripts/observations/jaccard_similarity.sh
```
The corresponding figure is `plots/Figure3:Jaccard-similarity.pdf`.

### Other numbers
### Section 1
- Error cases of top-ranking models
```sh
sh scripts/observations/error_cases_of_top_ranking_models.sh
```
### Section 3
- NL execution accuracy on the 348 sampled correct training cases
```sh
sh scripts/observations/nl_execution_accuracy_of_sampled_correct_cases.sh
```

## Error Detection and Fixing
### Effectiveness
```sh
sh scripts/evaluation/consistency_check_and_error_fixing.sh
```
Four files will be created in the `result/` directory. Two for the training set and two for the dev set.
#### Detecting Errors
To check the NL execution consistency for the correct cases in the sampled training set, you can filter by the condition `original gold exec consistent` = 1 in `correct_cases_for_the_train_set.tsv` to get the consistency rate.

For the error cases in the sampled training set, you can filter by the condition `original gold exec consistent` = 0 in `error_cases_for_the_train_set.tsv` to get the inconsistency rate.

For the consistency rate of the correct dev set and inconsistency rate of the error dev set, you can filter by the condition `original gold exec consistent` = 1/0 in the corresponding files.

#### Automated SQL Fix
To check the false positive fixes for the correct cases in the sampled training set, you can filter by the condition `SQLDRILLER selected gold` != "-" in `correct_cases_for_the_train_set.tsv`.

To check the correct fixes for the error cases in the sampled training set, you can filter by the condition `SQLDRILLER selected gold` != "-" in `error_cases_for_the_train_set.tsv`.

For the false positive and correct fixes of the correct cases and error cases in dev set, you can filter by the condition `SQLDRILLER selected gold` != "-" in the corresponding files.

### Model Accuracy
You can find the SQL prediction result on the original training set and refined training set of each model in the directory `prepared/prediction/original_train` and `prepared/prediction/refined_train` respectively.

Also, you can find multiple SQL predictions result along with the finally picked SQL by Execution Consistency in the directory `prepared/prediction/refined_train_multiple_predictions`.

The testsuite execution accuracy results are prepared in advance in the directory `prepared/testsuite_evaluation`. To check the original accuracy (the first column in the paper), you can check the baseline files in `prepared/testsuite_evaluation/result_dev_original`. To check the accuracy with fixed dev set, fixed train & dev set, and fixed train and dev set + EC optimization, you can check the corresponding baseline, refined, and SQLDRILLER files in `prepared/testsuite_evaluation/result_dev_gold_fixed`.


### Analysis
- To check cumulative distribution of inconsistency rate of in each schema and the relationship between Text-to-SQL inconsistency rate and case complexity (# of tokens in natural language question and SQL), run the following script:
```sh
sh scripts/evaluation/inconsistency_analysis.sh
```
The corresponding figures are `plots/Figure-12:schema-distribute-cdf.pdf`, `plots/Figure13a:nlq-distribute.pdf` and `plots/Figure13b:sql-distribute.pdf`.

## Reproduce
### Error Detection and Fixing
In our experiment, we use C3 to generate a candidate set of SQLs given an NL to check errors of the dataset. We have prepared the corresponding files in the 'infer/' directory, you can directly use them. 
To reproduce error detection and fixing, run the following command:
```sh
sh scripts/reproduce/error_detection.sh -dataset_type dev
```
For training set, replace the dataset_type with "train".
### Model Accuracy Improvement
To reproduce the result of model accuracy improvement with SQLDRILLER, you should prepare the multiple predictions file produced by each model (e.g., DIN-SQL), and then run the following command:
```sh
sh scripts/reproduce/model_accuracy_improvement.sh -gpt_predictions_path path_to_the_multiple_predictions_file -save_subdir path_to_the_subdir_of_logs  -save_file path_to_the_prediction_file
``` 
Then you can get the final predicted sqls in `save_file`, and can see the logs under the directory `logs/path_to_the_subdir_of_logs`.
