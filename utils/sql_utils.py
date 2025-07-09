import os

import sqlglot
from sqlglot.expressions import Literal

from .db_info.dbinfo import *
from .sqlite_utils import exec_on_db_


def get_schema_ddl(db_id: str, schema_file_dir: str) -> str:
    with open(os.path.join(schema_file_dir, db_id + ".sql")) as f:
        return f.read()


def get_schema_properties(db_id: str, schema_db_dir: str):
    sqlite_path = os.path.join(schema_db_dir, db_id, db_id + '.sqlite')
    table2column_properties, child2parent = extract_table_column_properties_path(sqlite_path)
    pks, fks = OrderedDict(), OrderedDict()
    for table, columns in table2column_properties.items():
        pk_cols = [(col_name, col_attrs['PK']) for col_name, col_attrs in columns.items() if col_attrs['PK'] > 0]
        pk_cols = sorted(pk_cols, key=lambda x: x[1])
        pk_cols = [col[0] for col in pk_cols]
        if pk_cols != []:
            pks[table] = pk_cols
    for referencing, referenced in child2parent.items():
        referencing_tbl_name, referencing_col_name = referencing[0], referencing[1]
        if referencing_tbl_name not in fks.keys():
            fks[referencing_tbl_name] = OrderedDict()
        fks[referencing_tbl_name][referencing_col_name] = referenced

    return table2column_properties, pks, fks


def column_concerning_integrity_constraints(table_name, column_name, pks: OrderedDict, fks: OrderedDict):
    if table_name in pks.keys() and column_name in pks[table_name]:
        return True
    if table_name in fks.keys() and column_name in fks[table_name].keys():
        return True
    for referencing_table, ref_dict in fks.items():
        for referencing_column, referenced_tup in ref_dict.items():
            referenced_table, referenced_column = referenced_tup
            if referenced_table == table_name and referenced_column == column_name:
                return True

    return False


def order_matters(sql):
    try:
        parsed_sql = sqlglot.parse(sql, read='sqlite')[0]
        if 'order' in parsed_sql.args.keys() and parsed_sql.args['order'] is not None:
            if 'limit' in parsed_sql.args.keys() and parsed_sql.args['limit'] is not None:
                limit_exp = parsed_sql.args['limit'].expression
                if type(limit_exp) is Literal and limit_exp.name == '1':
                    return False
            return True
        return False
    except:
        return False


def is_valid_sql(sql, db_id, schema_db_dir) -> bool:
    db_path = os.path.join(schema_db_dir, db_id, db_id + '.sqlite')
    flag, _ = exec_on_db_(db_path, sql)
    return flag != "exception"
