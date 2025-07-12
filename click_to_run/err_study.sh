#!/bin/bash

echo "Calculate error rates in Spider and BIRD's sampled train dataset."
python ./python_scripts/sql_error_rate.py


echo "Calculating Jaccard similarity between original and fixed SQLs in Spider and BIRD's sampled train dataset."
python ./python_scripts/sql_jaccard_similarity.py

echo "[Done] Results are saved in ./results/study/ ."