#!/usr/bin/bash

# test environment
python -m test_env

#######################################################################
#                 Reproduce our experimental results                  #
#######################################################################

# RQ1: Coverage and Comparison against State-of-the-Art Techniques
# To reproduce experimental results on Literature/Calcite/LeetCode benchmarks in Fig. 12, you should run the following commands.
python -m cli_within_timeout --filename benchmarks/literature.jsonlines --timeout 600 --output_file benchmarks/literature.out --integrity_constraint 1
python -m cli_within_timeout --filename benchmarks/calcite.jsonlines --timeout 600 --output_file benchmarks/calcite.out --integrity_constraint 1
# Attention !!!
# Since the LeetCode benchmarks consists of ~20,000 query pairs, verify them may take quite long time.
python -m cli_within_timeout --filename benchmarks/leetcode.jsonlines --timeout 600 --output_file benchmarks/leetcode.out --integrity_constraint 1

# RQ2: Effectiveness at Generating Counterexamples to Facilitate Downstream Tasks
# To reproduce experimental results on Literature/Calcite/LeetCode benchmarks in Fig. 13, you should run the following commands.
python -m cli_within_timeout --filename benchmarks/literature.jsonlines --timeout 600 --output_file benchmarks/literature_no_IC.out --integrity_constraint 0
python -m cli_within_timeout --filename benchmarks/calcite.jsonlines --timeout 600 --output_file benchmarks/calcite_no_IC.out --integrity_constraint 0
# Attention !!!
# Since the LeetCode benchmarks consists of ~20,000 query pairs, verify them may take quite long time.
python -m cli_within_timeout --filename benchmarks/leetcode.jsonlines --timeout 600 --output_file benchmarks/leetcode_no_IC.out --integrity_constraint 0

# check spurious counterexample
# 1) use MySQL to rule out most of them
python -m counterexample_checker --filename history/literature.out --output_file history/literature.badcase
python -m counterexample_checker --filename history/literature_no_IC.out --output_file history/literature_no_IC.badcase
python -m counterexample_checker --filename history/calcite.out --output_file history/calcite.badcase
python -m counterexample_checker --filename history/calcite_no_IC.out --output_file history/calcite_no_IC.badcase
python -m counterexample_checker --filename history/leetcode.out --output_file history/leetcode.badcase
python -m counterexample_checker --filename history/leetcode_no_IC.out --output_file history/leetcode_no_IC.badcase
# 2) manually check the rest "counterexamples" manually at https://onecompiler.com/mysql.
# This process may cost lots of time.

python -m count --filenames results/calcite.out results/literature.out results/leetcode.out --task coverage --output_file results/coverage.csv
python -m count --filenames results/calcite_no_IC.out results/literature_no_IC.out results/leetcode_no_IC.out --aux_filename results/coverage.csv --task coverage_no_ic --output_file results/coverage_no_IC.csv
python -m count --filenames results/calcite.out results/literature.out results/leetcode.out --task distribution --output_file results/distribution.csv

#######################################################################
#              Generate figures in the evaluation section             #
#######################################################################
# 1. The source files of Fig. 12 are figures/coverage_*.pdf
# 2. The source files of Fig. 13 are figures/counterexamples_*.pdf
# 3. The source files of Fig. 23 are figures/coverage_no_IC_*.pdf
# 4. The source file of Fig. 14 is figures/distribution.pdf
python -m plot --filename results/coverage.csv --task coverage --output_dir figures/
python -m plot --filename results/counterexamples.csv --task counterexample --output_dir figures/
python -m plot --filename results/coverage_no_IC.csv --task coverage_no_ic --output_dir figures/
python -m plot --filename results/distribution.csv --task distribution --output_dir figures/

#######################################################################
#                          Other resources                            #
#######################################################################

# The source files in overview and appendix.
# 1. The source file of Fig. 15 is resources/overview-example.pptx
# 2. The source file of Fig. 20 is resources/exceptall-groupby.pptx
