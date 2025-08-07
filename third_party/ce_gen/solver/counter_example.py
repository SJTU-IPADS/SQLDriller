import random
import sqlglot
import copy
from third_party.ce_gen.solver.process_sql import find_col_related_literals, get_type_of_col, DataType
from third_party.ce_gen.solver.app import VerieqlApp
from sqlglot.optimizer.scope import build_scope
from sqlglot.optimizer.qualify import qualify
from utils.llm_utils import gpt_reply_n, GPT_3_5_TURBO
import sqlite3

generate_values_for_column_prompt_without_sql = \
    ("Given the database schema definition with column name and column type: \n%s. \n"
     "Please generate 10 valid values for the column %s in list format and reserve double quotation marks. "
     "The list format should be like: [\"value1\", \"value2\", ... , \"value10\"]")
        
def post_process_value_list(candidate_values_list: list, constant_list: list) -> list:
    if len(candidate_values_list) == 0 or type(candidate_values_list[0]) != str:
        return candidate_values_list
    filter_list = []
    for value in candidate_values_list:
        for constant_value in constant_list:
            if value.lower() == constant_value.lower():
                break
        else:                       
            value = value.replace("'", " ").replace("  ", " ").strip()
            filter_list.append(value)
    return filter_list

def extract_values_from_sqlite(db: str, table: str, col: str) -> list:
    sqlite_path = f"data/bird/schema_for_sample_values/{db}/{db}.sqlite"
    conn = sqlite3.connect(sqlite_path)
    cursor = conn.cursor()
    cursor.execute(f"SELECT `{col}` FROM (SELECT DISTINCT `{col}` FROM `{table}`) T ORDER BY RANDOM() LIMIT 20")
    distinct_col_values = cursor.fetchall()
    col_vals = [col_value[0] for col_value in distinct_col_values if col_value[0] is not None]
    return col_vals

def generate_values_for_column(tables: list,
                               total_dict: dict, 
                               schema: dict,
                               constraints: list,
                               db_name: str,
                               benchmark: str):
    # generate values for all columns in all tables
    tables_ = list(schema.keys())
    for table in tables_:
        for col in schema[table]:
            if get_type_of_col(table, col, schema) != DataType.STRING and benchmark == "spider":
                continue
            try:
                candidate_values_list = []
                if benchmark == "spider" or benchmark == "beaver":
                    conn = sqlite3.connect("third_party/ce_gen/solver/column_values.sqlite")
                    cursor = conn.cursor()
                    get_col_vals = f"SELECT COL_VALS FROM COL_VALS WHERE db_name='{db_name}' and table_name='{table}' and col_name='{col}'"
                    cursor.execute(get_col_vals)
                    candidate_values = cursor.fetchone()
                    if candidate_values is None:
                        prompt_without_sql = generate_values_for_column_prompt_without_sql % (table + str(schema[table]), col)
                        messages_without_sql = [{"role": "user", "content": prompt_without_sql}]
                        candidate_values_without_sql = gpt_reply_n(messages_without_sql, model=GPT_3_5_TURBO)[0]
                        candidate_values_list_without_sql = eval(candidate_values_without_sql)
                        if get_type_of_col(table, col, schema) in (DataType.INTEGER, DataType.NUMERIC):
                            candidate_values_list_without_sql = [eval(v.lstrip("0") if len(v) > 1 else v ) for v in candidate_values_list_without_sql]
                        assert type(candidate_values_list_without_sql) == list
                        candidate_values_list = candidate_values_list_without_sql
                        cursor.execute("INSERT INTO COL_VALS(db_name, table_name, col_name, col_vals) VALUES (?, ?, ?, ?)", (db_name, table, col, candidate_values_without_sql))
                        conn.commit()
                    else:
                        candidate_values_list = eval(candidate_values[0])
                elif benchmark == "bird":
                    candidate_values_list = extract_values_from_sqlite(db_name, table, col)
                else:
                    assert(False)
            except Exception as e:
                print(e)

            if get_type_of_col(table, col, schema) == DataType.INTEGER and (int(candidate_values_list[0]) > 2147483647 or int(candidate_values_list[0]) < -2147483648):
                candidate_values_list = [random.randint(-10000, 10000) for i in range(20)]
            if (table, col) in total_dict:
                if get_type_of_col(table, col, schema) == DataType.STRING:
                    del total_dict[(table, col)]
                else:
                    candidate_values_list = post_process_value_list(candidate_values_list, total_dict[(table, col)])
                    total_dict[(table, col)].extend(candidate_values_list)
                    total_dict[(table, col)] = list(set(total_dict[(table, col)]))
            else:
                candidate_values_list = post_process_value_list(candidate_values_list, [])
                total_dict[(table, col)] = candidate_values_list
    
    pk_list = []
    # insert into the constraints
    for db_id in tables_:
        for col in schema.get(db_id):
            key = (db_id, col)
            constant_pool = []
            col_type = get_type_of_col(db_id, col, schema)
            # skip foreign key
            foreign_key = db_id + "__" + col
            is_foreign_key = False
            for constraint in constraints:
                if 'foreign' in constraint and foreign_key == constraint['foreign'][0]['value']:
                    primary_key = constraint['foreign'][1]['value']
                    pk_list.append(primary_key)
                    is_foreign_key = True
                    # add not null for foreign key
                    not_null_constraint = {'not_null': {'value': db_id + "__" + col.upper()}}
                    if not not_null_constraint in constraints:
                        constraints.append(not_null_constraint)
                    break
            if not is_foreign_key:
                if key in total_dict:
                    constant_pool = total_dict.get(key)
                if (constant_pool is None or len(constant_pool) == 0) and (col_type == DataType.INTEGER or col_type == DataType.NUMERIC):
                    if len(constant_pool) == 0:
                        between_array = [{"value": db_id + "__" + col}, 1, 10000]
                    else:
                        between_array = [{"value": db_id + "__" + col}, min(min([eval(v) if type(v) == str else v for v in constant_pool]), 0), max([eval(v) if type(v) == str else v for v in constant_pool]) * 2]
                    constraints.append({"between": between_array})
                elif col_type == DataType.STRING or (constant_pool is not None and (col_type == DataType.INTEGER or col_type == DataType.NUMERIC)):
                    in_array = [{"value": db_id + "__" + col}]
                    values_array = []
                    for val in constant_pool:
                        if type(val) == str and len(val) >= 200:
                            continue
                        values_array.append({"literal": val})
                    if len(values_array) != 0:
                        in_array.append(values_array)
                        constraints.append({"in": in_array})
                else:
                    # add not_null constraints
                    constraints.append({'not_null': {'value': db_id + "__" + col.upper()}})

                
    for pk in pk_list:
        has_pk = False
        constant_pool = []
        for constraint in constraints:
            if ('in' in constraint and pk == constraint['in'][0]['value']) or ('between' in constraint and pk == constraint['between'][0]['value']):
                has_pk = True
                break
        if not has_pk:
            key = tuple(pk.split("__"))
            col_type = get_type_of_col(key[0], key[1], schema)
            if key in total_dict:
                constant_pool = total_dict.get(key)
            if constant_pool is None and (col_type == DataType.INTEGER or col_type == DataType.NUMERIC):
                if len(constant_pool) == 0:
                    between_array = [{"value": pk}, 0, 10000]
                else:
                    between_array = [{"value": pk}, min(min([eval(v) if type(v) == str else v for v in constant_pool]), 0), max([eval(v) if type(v) == str else v for v in constant_pool]) * 2]
                constraints.append({"between": between_array})
            elif col_type == DataType.STRING or (constant_pool is not None and (col_type == DataType.INTEGER or col_type == DataType.NUMERIC)):
                in_array = [{"value": pk}]
                values_array = []
                for val in constant_pool:
                    if type(val) == str and len(val) >= 200:
                        continue
                    values_array.append({"literal": val})
                if len(values_array) != 0:
                    in_array.append(values_array)
                    constraints.append({"in": in_array})


def generate_counter_example(gold: str,
                             pred: str,
                             ast0: sqlglot.Expression,
                             ast1: sqlglot.Expression,
                             schema: dict,
                             constraints: list,
                             db_name: str,
                             row_num: int,
                             timeout: int,
                             benchmark: str) -> str:
    """
    Generate the counter example of the two input asts.

    Args:
        ast0: the first sql ast.
        ast1: the second sql ast.
        schema: the schema of two sqls.
        constraint: the constraint of two sqls(including integrity constraint).

    Returns:
        The counter example which differentiate the two asts.
    """
    qualify(ast0, schema=schema, dialect="sqlite")
    qualify(ast1, schema=schema, dialect="sqlite")
    scope0 = build_scope(ast0)
    scope1 = build_scope(ast1)
    total_dict = {}
    # only consider integer and string now
    find_col_related_literals(scope0, total_dict)
    find_col_related_literals(scope1, total_dict)
    # get all related tables of two sqls
    tables0 = [
        source.args['this'].output_name.upper()
        for scope in scope0.traverse()
        for alias, (node, source) in scope.selected_sources.items()
        if isinstance(source, sqlglot.exp.Table)]
    tables1 = [
        source.args['this'].output_name.upper()
        for scope in scope1.traverse()
        for alias, (node, source) in scope.selected_sources.items()
        if isinstance(source, sqlglot.exp.Table)]

    # consider the constant pool by sqls
    for key, value in total_dict.items():
        if key[0] not in schema or key[1] not in schema.get(key[0]):
            continue
        if get_type_of_col(key[0], key[1], schema) == DataType.INTEGER:
            total_dict[key] = [int(float(num)) for num in value]
        elif get_type_of_col(key[0], key[1], schema) == DataType.NUMERIC:
            total_dict[key] = [float(num) for num in value]
        elif get_type_of_col(key[0], key[1], schema) == DataType.STRING:
            # use all the string to construct the constant pool, we can do nothing here
            pass
    # move the constants to primary table
    for key, value in total_dict.copy().items():
            foreign_key = key[0] + "__" + key[1]
            for constraint in constraints:
                if 'foreign' in constraint and foreign_key == constraint['foreign'][0]['value']:
                    primary_key = constraint['foreign'][1]['value']
                    total_dict[(primary_key.split("__")[0], primary_key.split("__")[1])] = value
    cache_dict = copy.deepcopy(total_dict)
    # construct the constant pool of the related table
    # traversing the schema of using table and construct the pool
    constraint_copy = copy.deepcopy(constraints)
    generate_values_for_column(list(set(tables0 + tables1)), total_dict, schema, constraint_copy, db_name, benchmark)
    with VerieqlApp() as verieqlApp:
        content = verieqlApp.run(gold, pred, str(schema), str(constraint_copy), row_num=row_num, timeout=timeout)
        for _, values in cache_dict.items():
            for value in values:
                if type(value) == str and value.upper() in content:
                    content = content.replace(value.upper(), value)
        return content
    
