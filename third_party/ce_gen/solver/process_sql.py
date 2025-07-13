import sqlglot
import sqlglot.optimizer.scope
from enum import Enum


class DataType(Enum):
    INTEGER = 1
    STRING = 2
    NUMERIC = 3,
    DATA = 4,
    UNKNOWN = -1


def get_type_of_col(db: str, col: str, schema: dict) -> DataType:
    col_type = schema.get(db).get(col)
    if col_type == 'INT':
        return DataType.INTEGER
    elif col_type == 'VARCHAR' or col_type == 'TEXT' or col_type == 'CHARACTER':
        return DataType.STRING
    elif col_type == 'NUMERIC':
        return DataType.NUMERIC
    elif col_type == "DATE":
        return DataType.DATA
    return DataType.UNKNOWN


def get_schema_constraints(schema_properties: tuple) -> (dict, list):
    table2column_properties = schema_properties[0]
    pks = schema_properties[1]
    fks = schema_properties[2]
    tables = {}
    constraints = []
    for table in table2column_properties:
        table_upper = table.upper()
        tables[table_upper] = {}
        for column in table2column_properties[table]:
            if table2column_properties[table][column]['type'].upper() in {"BOOL", "INT", "TIME", "VARCHAR", "NUMERIC", "DATE"}:
                tables[table_upper][column.upper()] = table2column_properties[table][column]['type'].upper()
            elif table2column_properties[table][column]['type'].upper() == 'TEXT' or 'CHAR' in table2column_properties[table][column]['type'].upper():
                tables[table_upper][column.upper()] = 'VARCHAR'
            elif 'FLOAT' in table2column_properties[table][column]['type'].upper() or 'REAL' in table2column_properties[table][column]['type'].upper() \
                or 'DECIMAL' in table2column_properties[table][column]['type'].upper():
                tables[table_upper][column.upper()] = 'NUMERIC'
            elif table2column_properties[table][column]['type'].upper() in {"TIMESTAMP", "DATETIME"}:
                tables[table_upper][column.upper()] = 'DATE'
            elif table2column_properties[table][column]['type'].upper() == 'INTEGER':
                tables[table_upper][column.upper()] = 'INT'
            else:
                tables[table_upper][column.upper()] = table2column_properties[table][column]['type'].upper()
                
            if table2column_properties[table][column]['notnull']:
                constraints.append({'not_null': {'value': table_upper + "__" + column.upper()}})
                
            if table2column_properties[table][column]['unique']:
                constraints.append({'primary': [{'value': table_upper + "__" + column.upper()}]})
        
    for pk in pks:
        constraints.append({'primary': [{'value': pk.upper() + "__" + col.upper()} for col in pks[pk]]})
    
    for fk in fks:
        for col in fks[fk]:
            constraints.append({'foreign': [{'value': fk.upper() + "__" + col.upper()} , {'value': fks[fk][col][0].upper() + "__" + fks[fk][col][1].upper()}]})
            
    # return tables, constraints
    return tables, constraints


def find_col_related_literals(scope: sqlglot.optimizer.scope, total_dict: dict) -> None:
    """
    Find all col related literals in the ast.

    Args:
        scope: the scope of the ast.
        total_dict: the dictionary of (table, column) pair and related values.

    Returns:
        Nothing because using the totalDict to store the result.
    """
    operator_set = {sqlglot.exp.LT, sqlglot.exp.LTE, sqlglot.exp.GT, sqlglot.exp.GTE, sqlglot.exp.EQ, sqlglot.exp.NEQ}
    predicates = scope.find_all(sqlglot.exp.Predicate)
    sources = scope.selected_sources

    for p in predicates:
        if p.__class__ in operator_set:
            column = None
            literal = None
            if (isinstance(p.args['expression'], sqlglot.exp.Literal)
                    and isinstance(p.args['this'], sqlglot.exp.Column)
                    or isinstance(p.args['this'], sqlglot.exp.Dot)):
                if isinstance(p.args['this'], sqlglot.exp.Dot):
                    column = p.args['this'].args['this']
                else:
                    column = p.args['this']
                literal = p.args['expression']
            if (isinstance(p.args['this'], sqlglot.exp.Literal)
                    and isinstance(p.args['expression'], sqlglot.exp.Column)
                    or isinstance(p.args['expression'], sqlglot.exp.Dot)):
                if isinstance(p.args['expression'], sqlglot.exp.Dot):
                    column = p.args['expression'].args['this']
                else:
                    column = p.args['expression']
                literal = p.args['this']
            if column is not None and literal is not None:
                assert column.table in sources
                key = (sources[column.table][0].name.upper(), column.alias_or_name.upper())
                if key not in total_dict:
                    total_dict[key] = []
                if literal.this not in total_dict[key]:
                    total_dict[key].append(literal.this)
    subquery_scopes = scope.subquery_scopes
    for subquery_scope in subquery_scopes:
        find_col_related_literals(subquery_scope, total_dict)
