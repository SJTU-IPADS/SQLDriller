import collections
import re

from sql_metadata import Parser
import pandas as pd


def sql_normalization(sql):
    sql = sql.strip()
    def white_space_fix(s):
        parsed_s = Parser(s)
        s = " ".join([token.value for token in parsed_s.tokens])

        return s

    # convert everything except text between single quotation marks to lower case
    def lower(s):
        in_quotation = False
        out_s = ""
        for char in s:
            if in_quotation:
                out_s += char
            else:
                out_s += char.lower()

            if char == "'":
                if in_quotation:
                    in_quotation = False
                else:
                    in_quotation = True

        return out_s

    # remove ";"
    def remove_semicolon(s):
        if s.endswith(";"):
            s = s[:-1]
        return s

    # double quotation -> single quotation
    def double2single(s):
        return s.replace("\"", "'")

    def add_asc(s):
        pattern = re.compile(r'order by (?:\w+ \( \S+ \)|\w+\.\w+|\w+)(?: (?:\+|\-|\<|\<\=|\>|\>\=) (?:\w+ \( \S+ \)|\w+\.\w+|\w+))*')
        if "order by" in s and "asc" not in s and "desc" not in s:
            for p_str in pattern.findall(s):
                s = s.replace(p_str, p_str + " asc")

        return s

    def sql_split(s):
        while "  " in s:
            s = s.replace("  ", " ")
        s = s.strip()
        i = 0
        toks = []
        while i < len(s):
            tok = ""
            if s[i] == "'":
                tok = tok + s[i]
                i += 1
                while i < len(s) and s[i] != "'":
                    tok = tok + s[i]
                    i += 1
                if i < len(s):
                    tok = tok + s[i]
                    i += 1
            else:
                while i < len(s) and s[i] != " ":
                    tok = tok + s[i]
                    i += 1
                while i < len(s) and s[i] == " ":
                    i += 1
            toks.append(tok)
        return toks

    def remove_table_alias(s):
        tables_aliases = Parser(s).tables_aliases
        new_tables_aliases = {}
        for i in range(1, 11):
            if "t{}".format(i) in tables_aliases.keys():
                new_tables_aliases["t{}".format(i)] = tables_aliases["t{}".format(i)]
        table_names = []
        for tok in sql_split(s):
            if '.' in tok:
                table_names.append(tok.split('.')[0])
        for table_name in table_names:
            if table_name in tables_aliases.keys():
                new_tables_aliases[table_name] = tables_aliases[table_name]
        tables_aliases = new_tables_aliases

        new_s = []
        pre_tok = ""
        for tok in sql_split(s):
            if tok in tables_aliases.keys():
                if pre_tok == 'as':
                    new_s = new_s[:-1]
                elif pre_tok != tables_aliases[tok]:
                    new_s.append(tables_aliases[tok])
            elif '.' in tok:
                split_toks = tok.split('.')
                for i in range(len(split_toks)):
                    if len(split_toks[i]) > 2 and split_toks[i][0] == "'" and split_toks[i][-1] == "'":
                        split_toks[i] = split_toks[i].replace("'", "")
                        split_toks[i] = split_toks[i].lower()
                    if split_toks[i] in tables_aliases.keys():
                        split_toks[i] = tables_aliases[split_toks[i]]
                new_s.append('.'.join(split_toks))
            else:
                new_s.append(tok)
            pre_tok = tok

        # remove as
        s = new_s
        new_s = []
        for i in range(len(s)):
            if s[i] == "as":
                continue
            if i > 0 and s[i-1] == "as":
                continue
            new_s.append(s[i])
        new_s = ' '.join(new_s)

        # for k, v in tables_aliases.items():
        #     s = s.replace("as " + k + " ", "")
        #     s = s.replace(k, v)

        return new_s

    processing_func = lambda x: remove_table_alias(add_asc(lower(white_space_fix(double2single(remove_semicolon(x))))))

    return processing_func(sql.strip())


def isNegativeInt(string):
    if string.startswith("-") and string[1:].isdigit():
        return True
    else:
        return False


def isFloat(string):
    if string.startswith("-"):
        string = string[1:]

    s = string.split(".")
    if len(s) > 2:
        return False
    else:
        for s_i in s:
            if not s_i.isdigit():
                return False
        return True





sampled_training_schemas = ['department_management', 'farm', 'student_assessment', 'bike_1', 'book_2', 'musical',
                            'twitter_1', 'product_catalog', 'flight_1', 'allergy_1']
sampled_dev_schemas = ["wta_1", "battle_death", "student_transcripts_tracking", "tvshow", "flight_2"]
sampled_train_cases = 500
sampled_dev_cases = 1034
dev_sheet_name = "gold refined-1034"
train_sheet_name = "gold error-train"
sheet_path = "prepared/case_study.xlsx"


def get_df_for_dataset(dataset_type: str, is_sampled = True, start_id = -1, end_id = -1) -> pd.DataFrame:
    if start_id == -1:
        start_id = 0
    if dataset_type == "train":
        schemas = sampled_training_schemas
        sheet_name = train_sheet_name
        if end_id == -1:
            end_id = sampled_train_cases
    else:
        schemas = sampled_dev_schemas
        sheet_name = dev_sheet_name
        if end_id == -1:
            end_id = sampled_dev_cases
    df = pd.read_excel(sheet_path, sheet_name=sheet_name)
    # filter by case ids
    df = df[(start_id <= df["case id"]) & (df["case id"] < end_id)]
    if is_sampled:
        # filter by sampled schemas
        df = df[df["db_id"].isin(schemas)]
    return df    

def get_error_cases(dataset_type: str, is_sampled = True) -> pd.DataFrame:
    df = get_df_for_dataset(dataset_type, is_sampled)
    # filter out the error cases
    df = df[df["original gold tag according to exec res"] == 0]
    return df

def get_correct_cases(dataset_type: str, is_sampled = True) -> pd.DataFrame:
    df = get_df_for_dataset(dataset_type, is_sampled)
    df = df[df["original gold tag according to exec res"] == 1]
    return df

def get_error_ids(dataset_type: str, is_sampled = True):
    df = get_error_cases(dataset_type, is_sampled)
    return df["case id"].tolist()

def get_correct_ids(dataset_type: str, is_sampled = True):
    error_ids = get_error_ids(dataset_type, is_sampled)
    if dataset_type == "train":
        end_id = sampled_train_cases
    else:
        end_id = sampled_dev_cases
 
    correct_ids = [id for id in range(end_id) if id not in error_ids]
    return correct_ids

def get_fixed_and_original_gold_in_train():
    sheet_name = train_sheet_name
    end_id = sampled_train_cases
    df = pd.read_excel(sheet_path, sheet_name=sheet_name)
    df = df[(df["case id"] < end_id)]
    df = df[df["original gold tag"].isin(["0-1", "0-0"])]
    df = df[df["same with human selection / modify according to exec res"] == 1]
    return df["db_id"].tolist(), df["original gold"].tolist(), df["SQLDRILLER selected gold"].tolist()


# YC append util functions
def is_correct_case(gold_tag: str):
    # Correct: 1, 1-0, incorrect: 0, 0-0, 0-1, 1-1
    return gold_tag in ['1', '1-0']
