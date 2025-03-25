import copy
import os
import sqlite3
from shutil import copyfile

from third_party.test_suite_sql_eval.utils.exec_eval import eval_exec_match_on_one_sqlite
from utils.sql_utils import order_matters


def get_table_dependencies(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' and name !='sqlite_sequence';")
    tables = [row[0] for row in cursor.fetchall()]

    dependencies = {table: [] for table in tables}
    for table in tables:
        cursor.execute(f"PRAGMA foreign_key_list(`{table}`)")
        rows = cursor.fetchall()
        for row in rows:
            dependencies[row['table']].append(
                {'following_table': table, 'following_col': row['from'], 'primary_col': row['to']})

    return dependencies


def fetch_all_tables(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' and name !='sqlite_sequence';")
    tables = [row[0] for row in cursor.fetchall()]
    tables_content = {}
    tables_cols = {}
    for table in tables:
        cursor.execute(f"SELECT * FROM `{table}`")
        rows = cursor.fetchall()
        tables_content[table] = rows
        tables_cols[table] = [description[0] for description in cursor.description]
    return (tables_content, tables_cols)


def cascade_deletion(conn, primary_table, primary_row, dependencies, tables_content, tables_cols):
    cursor = conn.cursor()
    for dependency in dependencies[primary_table]:
        primary_col_value = primary_row[dependency['primary_col']]
        following_table = dependency['following_table']
        following_col = dependency['following_col']
        # search following col
        for row in tables_content[following_table]:
            if row[following_col] == primary_col_value:
                if primary_table != following_table:
                    if not cascade_deletion(conn, following_table, row, dependencies, tables_content, tables_cols):
                        return False
                elif {col: primary_row[col] for col in tables_cols[primary_table]} == {col: row[col] for col in tables_cols[following_table]}:
                    # a row references itsel
                    continue
                else:
                    return False
                backup_row = {col: row[col] for col in tables_cols[following_table]}
                # cursor.execute(f"DELETE FROM `{following_table}` WHERE %s" % (
                #     ' and '.join(
                #         [f"`{k}`=?" if v is not None else f"`{k}` is NULL"
                #          for
                #          k, v in backup_row.items()])), tuple(v for v in backup_row.values() if v is not None))
                cursor.execute(f"DELETE FROM `{following_table}` WHERE ROWID IN (SELECT ROWID FROM `{following_table}` WHERE %s LIMIT 1)" % (
                    ' and '.join(
                        [f"`{k}`=?" if v is not None else f"`{k}` is NULL"
                         for
                         k, v in backup_row.items()])), tuple(v for v in backup_row.values() if v is not None))

                conn.commit()
        cursor.execute(f"SELECT * FROM `{following_table}`")
        rows = cursor.fetchall()
        if len(rows) == 0:
            return False
    return True


def get_leaf_table(dependencies, tables):
    for table in tables:
        if table in dependencies.keys() and len(dependencies.get(table)) == 0:
            return table
    for table in tables:
        if table in dependencies.keys() and len(dependencies.get(table)) == 1 and table == dependencies.get(table)[0]['following_table']:
            return table


def remove_dependencies(dependencies, table):
    for primary_table, followings in dependencies.items():
        for following in followings.copy():
            if following['following_table'] == table:
                dependencies[primary_table].remove(following)
    del dependencies[table]


def resume_table_contents(conn, dependencies, tables, tables_content, tables_cols):
    cursor = conn.cursor()
    dependencies_copy = copy.deepcopy(dependencies)
    while len(dependencies_copy) > 0:
        leaf_table = get_leaf_table(dependencies_copy, tables)
        remove_dependencies(dependencies_copy, leaf_table)
        cursor.execute(f"DELETE FROM `{leaf_table}`")
        for row in tables_content[leaf_table]:
            cursor.execute(
                f"INSERT INTO `{leaf_table}`({', '.join(['`%s`' % col for col in tables_cols[leaf_table]])}) VALUES ({', '.join(['?' for _ in tables_cols[leaf_table]])})",
                tuple(row[col] for col in tables_cols[leaf_table]))
        conn.commit()


def minimize_database(db_path, gold, pred):
    order_matters_option = order_matters(gold)
    if eval_exec_match_on_one_sqlite(db_path, pred, gold, order_matters=order_matters_option) != 0:
        return None

    del_count = 1
    while del_count > 0:
        del_count = 0
        conn = sqlite3.connect(db_path)
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()

        # get foreign key dependencies
        dependencies = get_table_dependencies(conn)

        cursor.execute("SELECT name FROM sqlite_master WHERE type='table' and name !='sqlite_sequence';")
        tables = [row[0] for row in cursor.fetchall()]

        for table in tables:
            cursor.execute(f"SELECT * FROM `{table}`")
            rows = cursor.fetchall()
            columns = [description[0] for description in cursor.description]
            for i in range(len(rows)):
                tables_content, tables_cols = fetch_all_tables(conn)
                if len(tables_content[table]) == 1:
                    break
                row = rows[i]
                # the primary row
                backup_row = {col: row[col] for col in columns}
                # the following row
                if not cascade_deletion(conn, table, row, dependencies, tables_content, tables_cols):
                    resume_table_contents(conn, dependencies, tables, tables_content, tables_cols)
                    continue

                # cursor.execute(f"DELETE FROM `{table}` WHERE %s" % (
                #     ' and '.join(
                #         [f"`{k}`=?" if v is not None else f"`{k}` is NULL"
                #          for
                #          k, v in backup_row.items()])), tuple(v for v in backup_row.values() if v is not None))
                cursor.execute(f"DELETE FROM `{table}` WHERE ROWID IN (SELECT ROWID FROM `{table}` WHERE %s LIMIT 1)" % (
                    ' and '.join(
                        [f"`{k}`=?" if v is not None else f"`{k}` is NULL"
                         for
                         k, v in backup_row.items()])), tuple(v for v in backup_row.values() if v is not None))
                assert cursor.rowcount > 0
                # the following row
                conn.commit()

                if eval_exec_match_on_one_sqlite(db_path, pred, gold, order_matters=order_matters_option):
                    # after deletion, the two sqls become equal, so we need to resume the data
                    resume_table_contents(conn, dependencies, tables, tables_content, tables_cols)
                else:
                    del_count += 1
        conn.close()

    assert eval_exec_match_on_one_sqlite(db_path, pred, gold, order_matters=order_matters_option) == 0
    return db_path


def minimize_ce(original_ce_path, gold, pred, case_id, db_copy_dir):
    if not os.path.exists(os.path.join(db_copy_dir, str(case_id))):
        os.makedirs(os.path.join(db_copy_dir, str(case_id)))

    file_count = len(os.listdir(os.path.join(db_copy_dir, str(case_id))))
    db_copy_path = os.path.join(db_copy_dir, str(case_id), "ce%s.sqlite" % file_count)

    copyfile(original_ce_path, db_copy_path)
    return minimize_database(db_copy_path, gold, pred)


def count_rows(ce_path) -> int:
    conn = sqlite3.connect(ce_path)
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' and name !='sqlite_sequence';")
    tables = cursor.fetchall()

    # 统计每张表的行数
    row_count = 0
    for table in tables:
        table_name = table[0]
        cursor.execute(f"SELECT COUNT(*) FROM `{table_name}`")
        row_count += cursor.fetchone()[0]
        # 关闭连接
    conn.close()
    return row_count
