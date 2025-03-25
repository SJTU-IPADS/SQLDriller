import os
import re
import asyncio
import sqlite3
import threading
from typing import Tuple, Any, List, Set
from itertools import product
from collections import defaultdict
import tqdm
import random
from third_party.test_suite_sql_eval.utils.parse import get_all_preds_for_execution, remove_distinct
from itertools import chain

TIMEOUT = 60


# def is_num(s):
#     try:
#         float(s)
#         return True
#     except ValueError:
#         return False

def eval_element(e):
    try:
        e_eval = eval(e)
        if type(e_eval) in [int, float]:
            return e_eval
        else:
            return e
    except Exception:
        return e


def similar_eq(e1, e2):
    if e1 == e2:
        return True

    if type(e1) is str:
        e1 = eval_element(e1)
    if type(e2) is str:
        e2 = eval_element(e2)

    if type(e1) in [int, float]:
        e1 = round(float(e1), CustomTuple.precision)
    if type(e2) in [int, float]:
        e2 = round(float(e2), CustomTuple.precision)

    if type(e1) in [int, float] and type(e2) in [int, float] and abs(e1 - e2) < CustomTuple.sigma:
        return True
    elif str(e1) == str(e2):
        return True

    return False

def is_hashable(item):
    try:
        hash(item)
    except TypeError:
        return False
    return True

def remove_unhashable_elements(tup):
    return tuple(item for item in tup if is_hashable(item))


class CustomTuple(Tuple):

    precision = 2
    sigma = 1e-2

    def __eq__(self, other):
        if not isinstance(other, Tuple):
            return NotImplemented

        if len(self) != len(other):
            return False

        for e1, e2 in zip(self, other):
            if similar_eq(e1, e2):
                continue
            return False

        return True

    def __hash__(self):
        normalized_elements = []
        for e in self:
            if type(e) is str:
                e = eval_element(e)

            if type(e) in [int, float]:
                e = round(float(e), CustomTuple.precision)
            normalized_elements.append(e)

        normalized_tuple = tuple(normalized_elements)
        return hash(remove_unhashable_elements(normalized_tuple))


def permute_tuple(element: Tuple, perm: Tuple) -> Tuple:
    assert len(element) == len(perm)
    return CustomTuple([element[i] for i in perm])

# unorder each row in the table
# [result_1 and result_2 has the same bag of unordered row]
# is a necessary condition of
# [result_1 and result_2 are equivalent in denotation]
def quick_rej(result1: List[Tuple], result2: List[Tuple], order_matters: bool) -> bool:
    def type_fingerprint(e):
        if type(e) is str:
            return '[s]'
        elif type(e) in [int, float]:
            return '[n]'
        elif type(e) is bool:
            return '[b]'
        else:
            return '[x]'

    def unorder_row(row: Tuple) -> Tuple:
        return CustomTuple(sorted(row, key=lambda x: (type_fingerprint(x), x)))

    s1 = [unorder_row(row) for row in result1]
    s2 = [unorder_row(row) for row in result2]
    if order_matters:
        return s1 == s2
    else:
        return set(s1) == set(s2)


# return whether two bag of relations are equivalent
def multiset_eq(l1: List, l2: List) -> bool:
    if len(l1) != len(l2):
        return False
    d = defaultdict(int)
    for row in l1:
        d[row] = d[row] + 1
    for row in l2:
        d[row] = d[row] - 1

        if d[row] < 0:
            return False
    return True


def get_constraint_permutation(tab1_sets_by_columns: List[Set], result2: List[Tuple]):
    num_cols = len(result2[0])
    perm_constraints = [{i for i in range(num_cols)} for _ in range(num_cols)]
    if num_cols <= 3:
        return product(*perm_constraints)

    # we sample 20 rows and constrain the space of permutations
    for _ in range(20):
        random_tab2_row = random.choice(result2)

        for tab1_col in range(num_cols):
            for tab2_col in set(perm_constraints[tab1_col]):
                if all(map(lambda x: not similar_eq(random_tab2_row[tab2_col], x), tab1_sets_by_columns[tab1_col])):
                    perm_constraints[tab1_col].remove(tab2_col)
    return product(*perm_constraints)


# check whether two denotations are correct
def result_eq(result1: List[Tuple], result2: List[Tuple], order_matters: bool) -> bool:
    if result1 == result2:
        return True

    if len(result1) == 0 and len(result2) == 0:
        return True

    # if length is not the same, then they are definitely different bag of rows
    if len(result1) != len(result2):
        return False

    num_cols = len(result1[0])

    # if the results do not have the same number of columns, they are different
    if len(result2[0]) != num_cols:
        return False

    # Note: Check similar equal for each element in the tuple
    result1 = [CustomTuple(tuple(eval_element(element) for element in row)) for row in result1]
    result2 = [CustomTuple(tuple(eval_element(element) for element in row)) for row in result2]

    # unorder each row and compare whether the denotation is the same
    # this can already find most pair of denotations that are different
    if not quick_rej(result1, result2, order_matters):
        return False

    # the rest of the problem is in fact more complicated than one might think
    # we want to find a permutation of column order and a permutation of row order,
    # s.t. result_1 is the same as result_2
    # we return true if we can find such column & row permutations
    # and false if we cannot
    tab1_sets_by_columns = [{row[i] for row in result1} for i in range(num_cols)]

    # on a high level, we enumerate all possible column permutations that might make result_1 == result_2
    # we decrease the size of the column permutation space by the function get_constraint_permutation
    # if one of the permutation make result_1, result_2 equivalent, then they are equivalent
    for perm in get_constraint_permutation(tab1_sets_by_columns, result2):
        if len(perm) != len(set(perm)):
            continue
        if num_cols == 1:
            result2_perm = result2
        else:
            result2_perm = [permute_tuple(element, perm) for element in result2]
        if order_matters:
            if result1 == result2_perm:
                return True
        else:
            # in fact the first condition must hold if the second condition holds
            # but the first is way more efficient implementation-wise
            # and we use it to quickly reject impossible candidates
            if set(result1) == set(result2_perm) and multiset_eq(result1, result2_perm):
                return True
    return False


def replace_cur_year(query: str) -> str:
    return re.sub(
        "YEAR\s*\(\s*CURDATE\s*\(\s*\)\s*\)\s*", "2020", query, flags=re.IGNORECASE
    )


# get the database cursor for a sqlite database path
def get_cursor_from_path(sqlite_path: str):
    try:
        if not os.path.exists(sqlite_path):
            print("Openning a new connection %s" % sqlite_path)
        connection = sqlite3.connect(sqlite_path)
        connection.create_function("REGEXP", 2, regexp)
    except Exception as e:
        print(sqlite_path)
        raise e
    connection.text_factory = lambda b: b.decode(errors="ignore")
    cursor = connection.cursor()
    return cursor

def regexp(pattern, text):
    return re.search(pattern, text) is not None

async def exec_on_db_(sqlite_path: str, query: str) -> Tuple[str, Any]:
    query = replace_cur_year(query)
    cursor = get_cursor_from_path(sqlite_path)
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        cursor.connection.close()
        return "result", result
    except Exception as e:
        cursor.close()
        cursor.connection.close()
        return "exception", e


async def exec_on_db(
        sqlite_path: str, query: str, process_id: str = "", timeout: int = TIMEOUT
) -> Tuple[str, Any]:
    try:
        return await asyncio.wait_for(exec_on_db_(sqlite_path, query), timeout)
    except asyncio.TimeoutError:
        return ('exception', TimeoutError)
    except Exception as e:
        return ("exception", e)


# postprocess the model predictions to avoid execution errors
# e.g. removing spaces between ">" and "="
def postprocess(query: str) -> str:
    query = query.replace('> =', '>=').replace('< =', '<=').replace('! =', '!=')
    return query


# approximate whether p_str and g_str are semantically equivalent
# db is the database path
# we are going to evaluate whether they are equivalent in all the databases
# that are in the same directory as db
# 0 if denotationally equivalent
# 1 otherwise
# the meaning of each auxillary argument can be seen in the parser definition in evaluation.py
def eval_exec_match(db: str, p_str: str, g_str: str, plug_value=False, keep_distinct=True,
                    progress_bar_for_each_datapoint=False, order_matters=False) -> (int, str):
    # post-process the prediction.
    # e.g. removing spaces between ">" and "="
    ce_db_paths = []
    p_str, g_str = postprocess(p_str), postprocess(g_str)
    if not keep_distinct:
        p_str = remove_distinct(p_str)
        g_str = remove_distinct(g_str)

    # we decide whether two denotations are equivalent based on "bag semantics"
    # https://courses.cs.washington.edu/courses/cse444/10sp/lectures/lecture16.pdf
    # if there is order by in query, then we assume order of the rows matter
    # order by might also be used to find the max/min instead of sorting,
    # but in that case the result mostly only contains one row and hence order_matters does not make a difference
    # order_matters = 'order by' in g_str.lower()

    # find all databases in the same directory
    db_dir = os.path.dirname(db)
    db_paths = [os.path.join(db_dir, basename) for basename in os.listdir(db_dir) if '.sqlite' in basename]

    preds = [p_str]
    # if plug in value (i.e. we do not consider value prediction correctness)
    # enumerate all ways to plug in values in the gold query to the model predictions
    # otherwise, we only evaluate the predicted query with its own value prediction
    if plug_value:
        num, preds = get_all_preds_for_execution(g_str, p_str)
        # we did not add this line in our EMNLP work
        # this reduces "false negatives" when value is substituted
        preds = chain([p_str], preds)
        if num > 1024:
            preds = [p_str]

    for pred in preds:
        pred_passes = 1
        # compare the gold and predicted denotations on each database in the directory
        # wrap with progress bar if required
        if progress_bar_for_each_datapoint:
            ranger = tqdm.tqdm(db_paths)
        else:
            ranger = db_paths

        for db_path in ranger:
            g_flag, g_denotation = asyncio.run(exec_on_db(db_path, g_str))
            p_flag, p_denotation = asyncio.run(exec_on_db(db_path, pred))

            # we should expect the gold to be succesfully executed on the database
            assert g_flag != 'exception', 'gold query %s has error on database file %s' % (g_str, db_path)

            # wrong if execution fails, or if denotations are not equivalent, the prediction must be wrong
            if p_flag == 'exception' or not result_eq(g_denotation, p_denotation, order_matters=order_matters):
                pred_passes = 0
                ce_db_paths.append(db_path)
                break

        # the model prediction has the same denotation as the gold for all databases
        if pred_passes == 1:
            return 1, None

    # none of the predictions passed
    # if plug_value, best-effort try to find a ce that distinguishes the gold and all predictions
    target_ce_db_path = ce_db_paths[0]
    if plug_value and len(ce_db_paths) > 1:
        for ce_db_path in ce_db_paths:
            pred_passes = 0
            for pred in preds:
                g_flag, g_denotation = asyncio.run(exec_on_db(ce_db_path, g_str))
                p_flag, p_denotation = asyncio.run(exec_on_db(ce_db_path, pred))
                if p_flag != 'exception' and result_eq(g_denotation, p_denotation, order_matters=order_matters):
                    pred_passes = 1
                    break
            if pred_passes == 0:
                target_ce_db_path = ce_db_path
                break

    return 0, target_ce_db_path


def eval_exec_match_on_one_sqlite(db: str, p_str: str, g_str: str,
                                  plug_value=False, keep_distinct=True, order_matters=False) -> int:
    p_str, g_str = postprocess(p_str), postprocess(g_str)
    if not keep_distinct:
        p_str = remove_distinct(p_str)
        g_str = remove_distinct(g_str)

    preds = [p_str]
    if plug_value:
        num, preds = get_all_preds_for_execution(g_str, p_str)
        preds = chain([p_str], preds)
        if num > 1024:
            preds = [p_str]

    for pred in preds:
        pred_passes = 1
        g_flag, g_denotation = asyncio.run(exec_on_db(db, g_str))
        p_flag, p_denotation = asyncio.run(exec_on_db(db, pred))

        assert g_flag != 'exception', 'gold query %s has error on database file %s' % (g_str, db)

        if p_flag == 'exception' or not result_eq(g_denotation, p_denotation, order_matters=order_matters):
            pred_passes = 0
        if pred_passes == 1:
            return 1
    return 0
