from third_party.ce_gen.solver.prove_api import prove
from third_party.ce_gen.solver.process_sql import get_schema_constraints


def filter_insert(text):
    lines = text.strip().split('\n')
    result_lines = []
    for line in lines:
        if line.startswith("INSERT"):
            result_lines.append(line)
    return result_lines


def check_equivalence_by_verieql(gold: str, pred: str, schema_properties: tuple, db_name: str, row_num: int, benchmark: str, timeout=20):
    schema, constraint = get_schema_constraints(schema_properties)
    try:
        eq_tag, counter_example = prove(gold, pred, schema, constraint, db_name, row_num, timeout, benchmark)
        if not eq_tag:
            return False, filter_insert(counter_example)
    except Exception as e:
        print("VeriEQL exception: ", e)
    return (True, None)



