import subprocess
import traceback
from collections import OrderedDict
import jpype
import os

from third_party.test_suite_sql_eval.evaluation import evaluate_exec, exact_match
from third_party.test_suite_sql_eval.minimize_ce import minimize_ce
from third_party.test_suite_sql_eval.utils import exec_eval as EXEC_EVAL
from .constants import *
from .llm_utils import GPT_MAX_TRIALS, GPT_4_TURBO
from .prompt_utils import exec_ce_by_gpt
from .sql_utils import is_valid_sql


"""
Dataset refining services
"""
def simplify_ce(ce_path: str, gold, pred, case_id, db_copy_dir):
    return minimize_ce(ce_path, gold, pred, case_id, db_copy_dir)


"""
Interfaces that each model should provide
"""
def check_equivalence_by_sqlsolver(sql1: str, sql2: str, schema: str, timeout: int) -> str:
    try:
        os.environ['LD_LIBRARY_PATH'] = 'third_party/solver/lib'
        command = ['java', '-jar', 'third_party/solver/sqlsolver-v1.1.0.jar',
                    '-sql1str={}'.format(sql1),
                    '-sql2str={}'.format(sql2),
                    '-schemastr={}'.format(schema), 
                    '-timeout={}'.format(timeout),
                    '-print'
                    ]

        result = subprocess.run(command, capture_output=True, text=True)
        output_lines = result.stdout.splitlines()
        return output_lines[0].strip("[").strip("]")
    except Exception as e:
        return "NEQ"


"""
SQL functions
"""
def check_equivalence(gold, pred, ddl, schema_db_dir, db_dir, db_id, mode, benchmark, CEA=False, case_id=None, cea_path=None) -> (int, str):
    if mode == sql_equiv_mode.exec:
        try:
            exec_result, ce_path = evaluate_exec(gold, pred, schema_db_dir, db_dir, db_id, benchmark, CEA, case_id, cea_path)
            return (EQ_TAG, ce_path) if exec_result == 1 else ((NEQ_TAG, ce_path) if exec_result == 0 else (EMPTY_TAG, ce_path))
        except Exception as e:
            print("Exception in %s mode: %s" % (mode, e))
            return (EMPTY_TAG, None)
    elif mode == sql_equiv_mode.mixed:
        try:
            result = check_equivalence_by_sqlsolver(gold, pred, ddl, 5)
            if str(result) == 'EQ':
                return EQ_TAG, None
            else:
                exec_result, ce_path = evaluate_exec(gold, pred, schema_db_dir, db_dir, db_id, benchmark, CEA, case_id, cea_path)
                return (EQ_TAG, ce_path) if exec_result == 1 else ((NEQ_TAG, ce_path) if exec_result == 0 else (EMPTY_TAG, ce_path))
        except Exception as e:
            print("Exception in %s mode: %s" % (mode, e))
            exec_result, ce_path = evaluate_exec(gold, pred, schema_db_dir, db_dir, db_id, benchmark, CEA, case_id, cea_path)
            return (EQ_TAG, ce_path) if exec_result == 1 else ((NEQ_TAG, ce_path) if exec_result == 0 else (EMPTY_TAG, ce_path))
    else:
        assert False, "Currently do not support %s mode" % mode


def filter_meaningless_sql(candidates: list[str],
                           db_id: str,
                           db_dir: str,
                           schema_table_file_path: str,
                           schema_db_dir: str) -> list[str]:
    """
    1. deduplicate by exact-match
    2. drop SQLs with invalid syntax (by execution)
    """
    res = []
    if len(candidates) == 0:
        return candidates
    else:
        for candidate in candidates:
            duplicate_flag = False
            for sql in res:
                try:
                    if exact_match(candidate, sql, db_id, db_dir, schema_table_file_path):
                        duplicate_flag = True
                        break
                except Exception as e:
                    duplicate_flag = False
            if not duplicate_flag:
                res.append(candidate)
    res = [sql for sql in res if is_valid_sql(sql, db_id, schema_db_dir)]
    return res


def jvm_start(jars: list[str]):
    os.environ['LD_LIBRARY_PATH'] = 'third_party/solver/lib'
    jarPath = "-Djava.class.path=%s" % (":".join(jars))
    jpype.startJVM(jpype.getDefaultJVMPath(), "-ea", jarPath)


def jvm_shutdown():
    jpype.shutdownJVM()


'''
Helper functions for main workflow
'''
def get_gpt_nl_res_list(
        data_info_prompt,
        nlq,
        evidence=None,
        n=1,
        gpt_model=GPT_4_TURBO) -> (list[list], list[str]):
    trial = 0
    while trial < GPT_MAX_TRIALS:
        trial += 1
        try:
            gpt_exec_nl_res_list, reply_list = \
                exec_ce_by_gpt(data_info_prompt, nlq, evidence=evidence, n=n, gpt_model=gpt_model)
            return gpt_exec_nl_res_list, reply_list
        except Exception as e:
            if trial == GPT_MAX_TRIALS:
                raise e


def pick_majority_result(results: list[list], order_matters=False) -> list:
    clusters = OrderedDict()
    for res_id in range(len(results)):
        res = results[res_id]
        has_eq = False
        for existing_res_id in clusters.keys():
            existing_res = results[existing_res_id]
            if EXEC_EVAL.result_eq(existing_res, res, order_matters=order_matters):
                clusters[existing_res_id] += 1
                has_eq = True
                break
        if not has_eq:
            clusters[res_id] = 1

    max_cnt = -1
    majority_res = None
    for res_id in clusters.keys():
        if clusters[res_id] > max_cnt:
            max_cnt = clusters[res_id]
            majority_res = results[res_id]
    return majority_res
