import json
import time
import openai
import re
import os
import sqlite3

from .get_selfconsistent_output import get_sqls
from .sql_post_process import post_process_sql

chat_prompt = [
    {
        "role": "system",
        "content": "You are now an excellent SQL writer. "
                   "First I'll give you some tips, and I need you to remember the tips, and do not make the same mistakes."
    },
    {
        "role": "user",
        "content": "Tip 1: Notice that when generating SQLs, please reserve corresponding table names or alias of all the columns inside sub-queries of SQLs. "
                   "For example, 'SELECT A FROM B WHERE A IN (SELECT A FROM C WHERE C.A = A)' is not allowed, "
                   "but 'SELECT A FROM B WHERE A IN (SELECT C.A FROM C WHERE C.A = B.A)' is allowed."
                   "I need you to remember this tip in the the following questions."
    },
    {
        "role": "assistant",
        "content": "Thank you for the tip! I'll keep in mind to reserve table names or alias of all the columns inside sub-queries of SQLs."
    }
#     {
#         "role": "user",
#         "content": """Tips 1:
# Question: Which A has most number of B?
# Gold SQL: select A from B group by A order by count ( * ) desc limit 1;
# Notice that the Gold SQL doesn't select COUNT(*) because the question only wants to know the A and the number should be only used in ORDER BY clause, there are many questions asks in this way, and I need you to remember this in the the following questions."""
#     },
#     {
#         "role": "assistant",
#         "content": "Thank you for the tip! I'll keep in mind that when the question only asks for a certain field, I should not include the COUNT(*) in the SELECT statement, but instead use it in the ORDER BY clause to sort the results based on the count of that field."
#     },
#     {
#         "role": "user",
#         "content": """Tips 2:
# Don't use "IN", "OR", "LEFT JOIN" as it might cause extra results, use "INTERSECT" or "EXCEPT" instead, and remember to use "DISTINCT" or "LIMIT" when necessary.
# For example,
# Question: Who are the A who have been nominated for both B award and C award?
# Gold SQL should be: select A from X where award = 'B' intersect select A from X where award = 'C';"""
#     },
#     {
#         "role": "assistant",
#         "content": "Thank you for the tip! I'll remember to use \"INTERSECT\" or \"EXCEPT\" instead of \"IN\", \"OR\", or \"LEFT JOIN\" when I want to find records that match or don't match across two tables. Additionally, I'll make sure to use \"DISTINCT\" or \"LIMIT\" when necessary to avoid repetitive results or limit the number of results returned."
#     }
]

sql_pattern = re.compile(r'(?:SQL \d+:)(.*?);')
# sql_pattern = re.compile(r'(?:SQL \d+:)(SELECT.*?);')
# sql_pattern = re.compile(r'(?:SQL \d+:[^;]*)(SELECT.*?);')

postfix = "\n### Please provide %s candidate SQL queries for the previous question that you believe are the correct answers. " \
          "These candidate SQL queries are encouraged to differ greatly from each other in their syntax structures and used keywords, " \
          "as long as you believe they are correct corresponding to the previous question. " \
          "List the %s candidate SQL queries one by one in a JSON format with a key \"answers\"." \
          "The JSON format should be like: " \
          "{\"answers\": [\"SELECT...\", \"SELECT...\", ..., \"SELECT...\"] } \n"


def prompt_postfix(count: int):
    return postfix % (count, count)


def generate_reply(messages, n=1, temperature=1.0):
    completions = None
    while completions is None:
        try:
            completions = openai.ChatCompletion.create(
                model="gpt-4-turbo",
                messages=messages,
                temperature=temperature,
                n=n
            )
        except Exception as e:
            print("%s" % e)
            time.sleep(3)
    all_p_sqls = []
    for i in range(n):
        all_p_sqls.append(completions.choices[i].message.content.replace("\n", " "))
    return all_p_sqls


def replace_cur_year(query: str) -> str:
    return re.sub(
        "YEAR\s*\(\s*CURDATE\s*\(\s*\)\s*\)\s*", "2020", query, flags=re.IGNORECASE
    )


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

def exec_on_db_(sqlite_path: str, query: str):
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


def is_valid(sql, db_path):
    flag, _ = exec_on_db_(db_path, sql)
    if flag == "exception":
        return 0
    else:
        return 1


def get_sql(C3_item: dict, count: int, db_dir: str = None, self_consistent: bool = False) -> list:
    if not self_consistent:
        prompt = C3_item['input_sequence']
        if count > 1:
            prompt = prompt[:-6] + prompt_postfix(count)
        sqls = []
        for j in range(5):
            try:
                messages = chat_prompt.copy()
                messages.append({"role": "user", "content": prompt})
                reply = generate_reply(messages, n=1, temperature=1.2)
                if count > 1:
                    sql_json_ans = reply[0][reply[0].index('{'): reply[0].rindex('}') + 1]
                    sql_json_ans = json.loads(sql_json_ans)
                    sqls = sql_json_ans['answers']
                    # sqls = sql_pattern.findall(reply[0])
                else:
                    sqls = ['SELECT ' + reply[0]]

                for i in range(len(sqls)):
                    if '```sql' in sqls[i]:
                        sqls[i] = sqls[i].replace('```sql', '').replace('```', '')
                sqls = [post_process_sql(sql) for sql in sqls]
                if len(sqls) > count // 2:
                    break
            except Exception as e:
                continue
        return sqls
    else:
        assert count == 1, "self consistency only support output 1 prediction"
        db_dir = db_dir + '/' + C3_item['db_id'] + '/' + C3_item['db_id'] + '.sqlite'
        p_sqls = []
        for j in range(5):
            messages = chat_prompt.copy()
            input = C3_item['input_sequence']
            messages.append({"role": "user", "content": input})
            reply = None
            while reply is None:
                try:
                    reply = generate_reply(messages, n=count)
                except Exception as e:
                    print(e)
                    print(f"api error, wait for 3 seconds and retry...")
                    pass
            p_sqls = reply
            temp = []
            for p_sql in p_sqls:
                p_sql = 'SELECT ' + p_sql
                p_sql = post_process_sql(p_sql)
                temp.append(p_sql)
            p_sqls = temp
            if is_valid(p_sqls[0], db_dir):
                break
        return get_sqls(p_sqls, db_dir)



