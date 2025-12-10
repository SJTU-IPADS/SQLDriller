import os
import re
from collections import OrderedDict
import asyncio
from .sql_utils import get_schema_properties
from .sqlite_utils import exec_on_db_
from .llm_utils import gpt_reply_n, GPT_4_TURBO

'''
Prompt build-up functions
'''

select_all_query = "SELECT * from `%s`;"


def encode_schema_and_data_prompt(
        db_id,
        sqls,
        schema_db_dir,
        ce_path,
        concrete_data=True,
        cascade=False,
        column_slim=False):
    assert not concrete_data or ce_path is not None

    table2column_properties, pks, fks = get_schema_properties(db_id, schema_db_dir)
    sqls = [sql.strip().strip(";") for sql in sqls]
    all_used_tables = \
        [tbl_name for tbl_name in table2column_properties.keys()
         if any(map(lambda s: (" %s " % tbl_name.lower()) in s.lower() or (" %s)" % tbl_name.lower()) in s.lower() or s.lower().endswith(" %s" % tbl_name.lower()) \
             or ("\"%s\"" % tbl_name.lower()) in s.lower() or ("`%s`" % tbl_name.lower()) in s.lower(), sqls))]

    # Add cascade fk referenced used tables
    if cascade:
        while True:
            add_cascade_table = False
            for tbl_name in all_used_tables:
                if tbl_name not in fks.keys():
                    continue
                for referencing_col_name, referenced in fks[tbl_name].items():
                    (referenced_tbl_name, referenced_col_name) = referenced
                    if referenced_tbl_name not in all_used_tables:
                        all_used_tables.append(referenced_tbl_name)
                        add_cascade_table = True
            if not add_cascade_table:
                break

    # Load the counterexample
    ce = OrderedDict()
    if concrete_data:
        for tbl_name, columns in table2column_properties.items():
            if tbl_name not in all_used_tables:
                continue
            flag, res = exec_on_db_(ce_path, select_all_query % tbl_name)
            assert flag != "exception"
            if len(res) > 0:
                assert len(res[0]) == len(table2column_properties[tbl_name])
            ce[tbl_name] = list(res)

    # 1. List tables, columns and stored data
    prompt = ""
    for tbl_name, columns in table2column_properties.items():
        if tbl_name not in all_used_tables:
            continue

        if column_slim:
            tbl_schema = "Table " + tbl_name + "(" + ", ".join([k for k in columns.keys() if any(map(lambda s: k.lower() in s.lower(), sqls))]) + "), "
        else:
            tbl_schema = "Table " + tbl_name + "(" + ", ".join(columns.keys()) + "), "
        tbl_schema += ("%d records:" % len(ce[tbl_name]) if concrete_data else "") + "\n"

        if concrete_data:
            if column_slim:
                tbl_records = ", \n".join(["- " + str({k: v for (k, v) in zip(columns.keys(), record) if any(map(lambda s: k.lower() in s.lower(), sqls))}) for record in ce[tbl_name]])
            else:
                tbl_records = ", \n".join(["- " + str(dict(zip(columns.keys(), record))) for record in ce[tbl_name]])
            tbl_data = tbl_schema + (tbl_records if tbl_records != '' else '- (emptyset)') + "\n"
        else:
            tbl_data = tbl_schema
        prompt += tbl_data

    # 2. List pks and fks
    prompt += "\nNote that:\n"
    pk_fk_prompts = []
    for tbl_name, pk in pks.items():
        if tbl_name not in all_used_tables:
            continue
        pk_col_list = tbl_name + "." + pk[0] if len(pk) == 1 else ("(" + ", ".join(pk) + ")")
        tbl_pk_prompt = "- " + pk_col_list + " is a primary key uniquely identifying each record of %s." % tbl_name
        pk_fk_prompts.append(tbl_pk_prompt)
    for tbl_name, fk in fks.items():
        if tbl_name not in all_used_tables:
            continue
        for referencing_col_name, referenced in fk.items():
            (referenced_tbl_name, referenced_col_name) = referenced
            tbl_fk_prompt = "- " + "%s.%s is a foreign key referencing %s.%s." \
                            % (tbl_name, referencing_col_name, referenced_tbl_name, referenced_col_name)
            pk_fk_prompts.append(tbl_fk_prompt)

    for ic_prompt in pk_fk_prompts:
        prompt += ic_prompt + "\n"

    prompt += "Only the primary key can be used to uniquely identify each record of table (i.e., each instance of entity), " \
              "Other columns are non-unique attributes and cannot be used to uniquely identify each record. " \
              "(e.g., counting number of singer should count by singer ids but not different singer names despite namesake)"

    return prompt


CE_PROMPT_TEMPLATE_FILE_PATH = './utils/prompts/ce_prompt_template'
assert os.path.exists(CE_PROMPT_TEMPLATE_FILE_PATH)
with open(CE_PROMPT_TEMPLATE_FILE_PATH, 'r') as f:
    ce_prompt_template = f.read()


def encode_ce_prompt(data_info_prompt: str, nlq: str, evidence=None):
    nlq = "'" + nlq.strip() + "'"
    if evidence is not None:
        # For BIRD's evidence, encode into NLQ
        nlq += "\nand some hints about the query requirement that you should follow:\n'%s'\n" % evidence.strip()

    return ce_prompt_template % (data_info_prompt, nlq)


'''
GPT invocation and result parse function
'''


def exec_ce_by_gpt(
        data_info_prompt: str,
        nlq: str,
        evidence=None,
        n=1,
        gpt_model=GPT_4_TURBO) -> (list[list], list[str]):
    ce_prompt = encode_ce_prompt(data_info_prompt, nlq, evidence)
    messages = [{"role": "user", "content": ce_prompt}]
    res_list = asyncio.run(gpt_reply_n(messages, model=gpt_model, n=n))

    records_list = []
    has_exception_count = 0
    for res in res_list:
        record, has_exception = extract_exec_res_from_gpt_res(res)
        if has_exception:
            has_exception_count += 1
        else:
            records_list.append(record)

    if has_exception_count >= max(1, n//2):
        raise Exception("Has exception in extracting result from GPT response.")

    return records_list, res_list


def extract_exec_res_from_gpt_res(res: str) -> (list[tuple], bool):
    lines = res.split("\n")
    collect_line_id, collect_split_header = -1, None
    for i in range(len(lines) - 1, -1, -1):
        line = lines[i]
        match = re.search(r'#\s*result:', line)
        if match:
            collect_line_id = i
            collect_split_header = match.group()
            break

    if collect_line_id == -1:
        return [], True

    try:
        records = []
        line = lines[collect_line_id]
        s = line.split(collect_split_header)[1].strip()
        while not s.endswith("]") and collect_line_id + 1 < len(lines) and lines[collect_line_id + 1].strip() != '```':
            collect_line_id += 1
            s += lines[collect_line_id].strip()
            s = s.strip()
        records_eval = eval(s)
        if type(records_eval) is not list:
            records_eval = [records_eval]
        for r in records_eval:
            if type(r) != tuple:
                records.append((r,))
            else:
                records.append(r)
        return records, False
    except Exception:
        return [], True



