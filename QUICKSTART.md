## Prerequisites
### 1. Environments
 - Anaconda, Python 3.10 (> 3.9 is feasible)
 - Docker (to run VeriEQL for SQL counterexample generation)
 - Java JDK 17, Gradle 7.3.3 (optional, to run SQLSolver for SQL equivalence)

Run the following commands to set up:
```shell
# Create and activate Python environment
conda create -n SQLDriller python=3.10
conda activate SQLDriller
python -m pip install --upgrade pip
pip install -r requirements.txt

# Download nltk lib
python nltk_downloader.py

# Setup docker container for VeriEQL solver
export CURRENT_PATH=$(pwd)
cd ./third_party/test_suite_sql_eval/test_prover/VeriEQL/
sh verieql.sh
cd $CURRENT_PATH
```
### 2. OpenAI Key Configuration
Create a `.env` file in the root path of this repo and add your key information to the file:
```
OPENAI_API_KEY = [your-api-key]
OPENAI_API_BASE = [your-api-url]
```
### 3. Resource Downloading:
We have prepared the following resources for experiments:
- Download the prepared resource files for quick-start and result preview: [link](https://drive.google.com/file/d/1VyyQdeJWTK-_F5EoXcoFockDvptOttio/view?usp=sharing), unzip it to `./prepared/`.
- Download the prepared generated sqlite files for SQL execution: [link](https://drive.google.com/file/d/148GDu6nYFF8trqa-UlYR9mq-QH-r2kvq/view?usp=sharing), unzip it to `./dbs/`.


## Scripts

### Error Study

```shell
./click_to_run/err_study.sh
```
The results are shown in `./results/study/`:
```
./results/study/
|-- error/    # Error rates of each hardness level, and each schemas.
|-- jaccard/  # Jaccard similarity of original and fixed SQLs in sampled error cases
```

### Natural Language Execution

```shell
./click_to_run/nl.exec.sh spider gpt-4o
./click_to_run/nl.exec.sh bird gpt-4o
```

The results are shown in `./results/nl_exec/spider_gpt-4o/` and `./results/nl_exec/bird_gpt-4o/`:
```
./results/nl_exec/{dataset_name}_gpt-4o/
|-- exec_res/                   # Execution logs of each case
|-- nl_exec_accuracy.txt        # Results of NL exeuction accuracy
```
