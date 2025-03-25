import subprocess
import traceback
from collections import OrderedDict
import jpype
import os

import globals
from third_party.c3 import api as C3_MODEL
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


def get_schema_model_specific_info(model: str, dataset: str, item: dict) -> str:
    case_id, db_id = item['id'], item['db_id']
    if model == LLModel.C3:
        return C3_MODEL.get_schema_info(dataset, case_id, db_id)
    # elif model == LLModel.DIN_SQL:
    #     return DIN_SQL_MODEL.get_schema_info(dataset, case_id, db_id)
    # elif model == LLModel.DAIL_SQL:
    #     assert False, "Do not support model %s currently" % model
    # elif model == LLModel.RESD_natsql or model == LLModel.RESD_sql:
    #     return RESD_MODEL.get_schema_info(model, dataset, case_id, db_id)
    # elif is_pre_trained_llm_based(model):
    #     # todo: temporarily the same as RESD models
    #     return RESD_MODEL.get_schema_info(LLModel.RESD_natsql, dataset, case_id, db_id)
    else:
        assert False, "Do not support model %s currently" % model


def get_multiple_predictions_from_model(model: str, dataset: str, item: dict, max_count: int, schema_info=None) -> list[str]:
    candidates = []
    if model == LLModel.C3:
        candidates = C3_MODEL.generate_gpt_sql_answers(dataset, item, max_count)
    # elif model == LLModel.DIN_SQL:
    #     candidates = DIN_SQL_MODEL.generate_gpt_sql_answers(dataset, item, max_count)
    # elif model == LLModel.DAIL_SQL:
    #     assert False, "Do not support model %s currently" % model
    # elif model == LLModel.RESD_natsql or model == LLModel.RESD_sql:
    #     candidates = RESD_MODEL.generate_answers(model, dataset, item, max_count)
    # elif is_pre_trained_llm_based(model):
    #     # todo: temporarily the same as RESD models
    #     candidates = RESD_MODEL.generate_answers(LLModel.RESD_natsql, dataset, item, max_count)
    #     # candidates = T5_MODEL.generate_answers(model, dataset, item['nlq'], schema_info, max_count)
    else:
        assert False, "Do not support model %s currently" % model

    return candidates


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
def check_equivalence(gold, pred, ddl, db_dir, db_id, mode, benchmark, CEA=False, case_id=None, cea_path=None) -> (int, str):
    if mode == sql_equiv_mode.exec:
        try:
            exec_result, ce_path = evaluate_exec(gold, pred, db_dir, db_id, benchmark, CEA, case_id, cea_path)
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
                exec_result, ce_path = evaluate_exec(gold, pred, db_dir, db_id, benchmark, CEA, case_id, cea_path)
                return (EQ_TAG, ce_path) if exec_result == 1 else ((NEQ_TAG, ce_path) if exec_result == 0 else (EMPTY_TAG, ce_path))
        except Exception as e:
            print("Exception in %s mode: %s" % (mode, e))
            exec_result, ce_path = evaluate_exec(gold, pred, db_dir, db_id, benchmark, CEA, case_id, cea_path)
            return (EQ_TAG, ce_path) if exec_result == 1 else ((NEQ_TAG, ce_path) if exec_result == 0 else (EMPTY_TAG, ce_path))
    else:
        assert False, "Currently do not support %s mode" % mode


def filter_meaningless_sql(candidates: list[str], db_dir: str, db_id: str, benchmark) -> list[str]:
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
                    if exact_match(candidate, sql, db_dir, db_id, benchmark):
                        duplicate_flag = True
                        break
                except Exception as e:
                    duplicate_flag = False
            if not duplicate_flag:
                res.append(candidate)
    res = [sql for sql in res if is_valid_sql(sql, db_id, benchmark)]
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
        gpt_model=GPT_4_TURBO,
        log=True) -> (list[list], list[str]):
    trial = 0
    while trial < GPT_MAX_TRIALS:
        trial += 1
        try:
            gpt_exec_nl_res_list, reply_list = \
                exec_ce_by_gpt(data_info_prompt, nlq, evidence=evidence, n=n, gpt_model=gpt_model)
            if log:
                log_prompt = data_info_prompt + "\n\n" + nlq + ("\n\n" + evidence if evidence is not None else "")
                globals.log_gpt("exec_ce", log_prompt, reply_list)

            return gpt_exec_nl_res_list, reply_list
        except Exception as e:
            if log:
                globals.log_exception(traceback.format_exc())
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
