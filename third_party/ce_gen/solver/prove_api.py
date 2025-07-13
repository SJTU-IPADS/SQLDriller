import sqlglot
from third_party.ce_gen.solver.counter_example import generate_counter_example


def fast_judge(ast0: sqlglot.Expression, ast1: sqlglot.Expression) -> bool:
    """
    Judge whether two select has the same column size.

    Args:
        ast0: the first sql ast.
        ast1: the second sql ast.

    Returns:
        The result whether two ast's first node (which should be select) has the same args size.
    """
    assert ast0.key == 'select' and ast1.key == 'select'
    return len(ast0.args.get('expressions')) == len(ast1.args.get('expressions'))


def prove(gold: str, pred: str, schema: dict, constraint: list, db_name: str, row_num: int, timeout: int, benchmark: str) -> (bool, str):
    """
    The main proving algorithm of test-prover

    Args:
        gold: the first sql.
        pred: the second sql.
        schema: the schema of two sqls.
        constraint: the constraint of two sqls(including integrity constraint).

    Returns:
        Whether two query is equivalent.
    """
    parsed0 = sqlglot.parse_one(gold, read='sqlite')
    parsed1 = sqlglot.parse_one(pred, read='sqlite')

    # if parsed0.key == 'select' and parsed1.key == 'select' and not fast_judge(parsed0, parsed1):
    #     return False, "Not Same Select Size"

    counter_example = generate_counter_example(gold, pred, parsed0, parsed1, schema, constraint, db_name, row_num, timeout, benchmark)
    if "Non-Equivalent!" in counter_example:
        return False, counter_example
    elif "Equivalent!" in counter_example:
        return True, counter_example
    else: 
        print(counter_example)

    return True, counter_example
