#!/usr/bin/bash

# test environment
python -m test_env

# create toy_benchmark.jsonlines
head -n 2 benchmarks/literature.jsonlines > benchmarks/toy.jsonlines

# run RQ1 with a 30s timeout and consider integrity constraints
python -m cli_within_timeout --filename benchmarks/toy.jsonlines --timeout 30 --output_file results/toy.out --num_cores 2 --integrity_constraint 1

# since cannot decide counterexample is spurious or bug, please try them at here: https://onecompiler.com/mysql
python -m counterexample_checker --filename results/toy.out -o results/toy.badcase

# run RQ2 with a 30s timeout and ignore integrity constraints
python -m cli_within_timeout --filename benchmarks/toy.jsonlines --timeout 30 --output_file results/toy_no_IC.out --num_cores 2 --integrity_constraint 0

# since cannot decide counterexample is spurious or bug, please try them at here: https://onecompiler.com/mysql
python -m counterexample_checker --filename results/toy_no_IC.out -o results/toy_no_IC.badcase

# If you want to know more about VeriEQL, please play main.py. Very easy to use. :)