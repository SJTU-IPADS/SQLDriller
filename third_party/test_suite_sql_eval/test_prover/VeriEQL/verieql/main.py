# -*- coding: utf-8 -*-

from environment import Environment
import argparse
import ast
from cli_within_timeout import process_ends_with_max_timeout
from multiprocessing import (
    Process,
    Queue,
    cpu_count,
    Manager,
)
from constants import *



def main(sql1, sql2, schema, ROW_NUM=2, timeout=20, constraints=None, **kwargs):
    # with Environment(**kwargs) as env:
    #     for k, v in schema.items():
    #         env.create_database(attributes=v, bound_size=ROW_NUM, name=k)
    #     env.add_constraints(constraints)
    #     env.save_checkpoints()
    #     if env._script_writer is not None:
    #         env._script_writer.save_checkpoints()
    #     result = env.analyze(sql1, sql2, out_file="test/test.py")
        # if env.traversing_time is not None:
        #     print(f"Time cost: {env.traversing_time + env.solving_time:.2f}")
    manger = Manager()
    queue = manger.Queue()
    result = process_ends_with_max_timeout(0, schema, constraints, sql1, sql2, ROW_NUM, None, None, timeout, queue)

    if not STATE.NON_EQUIV in result['states']:
        print("\033[1;32;40m>>> Equivalent! \033[0m")
    else:
        print(result['counterexample'])
        print("\033[1;31;40m>>> Non-Equivalent! Found a counterexample! \033[0m")


if __name__ == '__main__':
    # sql1, sql2 = [
    #     "SELECT DISTINCT PAGE_ID AS RECOMMENDED_PAGE FROM (SELECT CASE WHEN USER1_ID=1 THEN USER2_ID WHEN USER2_ID=1 THEN USER1_ID ELSE NULL END AS USER_ID FROM FRIENDSHIP) AS TB1 JOIN LIKES AS TB2 ON TB1.USER_ID=TB2.USER_ID WHERE PAGE_ID NOT IN (SELECT PAGE_ID FROM LIKES WHERE USER_ID=1)",
    #     "SELECT DISTINCT PAGE_ID AS RECOMMENDED_PAGE FROM (SELECT B.USER_ID, B.PAGE_ID FROM FRIENDSHIP A LEFT OUTER JOIN LIKES B ON (A.USER2_ID=B.USER_ID OR A.USER1_ID=B.USER_ID) AND (A.USER1_ID=1 OR A.USER2_ID=1) WHERE B.PAGE_ID NOT IN (SELECT DISTINCT PAGE_ID FROM LIKES WHERE USER_ID=1)) T",
    # ]
    # sql1, sql2 = [
    #     "SELECT CONTINENT FROM CONTINENTS WHERE CONTINENT = 'ASIA'",
    #     "SELECT CONTINENT FROM CONTINENTS WHERE CONTINENT = 'EUROPE'",
    # ]
    # schema = {"FRIENDSHIP": {"USER1_ID": "INT", "USER2_ID": "INT"}, "LIKES": {"USER_ID": "INT", "PAGE_ID": "INT"}, }
    # schema = {"CONTINENTS": {"CONTID": "INT", "CONTINENT": "VARCHAR", "NAME": "VARCHAR"}, "COUNTRIES": {"COUNTRYID": "INT", "COUNTRYNAME": "VARCHAR", "CONTINENT": "INT"}, }
    # constants = [
    #     # use `__` to replace `.`, e.g., FRIENDSHIP.USER1_ID => FRIENDSHIP__USER1_ID
    #     {"primary": [{"value": "FRIENDSHIP__USER1_ID"}, {"value": "FRIENDSHIP__USER2_ID"}]},
    #     {"primary": [{"value": "LIKES__USER_ID"}, {"value": "LIKES__PAGE_ID"}]},
    #     {"neq": [{"value": "FRIENDSHIP__USER1_ID"}, {"value": "FRIENDSHIP__USER2_ID"}]},
    # ]
    # constants = [
        # use `__` to replace `.`, e.g., FRIENDSHIP.USER1_ID => FRIENDSHIP__USER1_ID
        # {"in":[{"value":"CONTINENTS__CONTINENT"},[{"literal":"ASIA"},{"literal":"EUROPE"}]]},
        # {"between":[{"value":"CONTINENTS__CONTID"},20,30]}
        # {"primary": [{"value": "CONTINENTS__CONTID"}]},
        # {"primary": [{"value": "COUNTRIES__ID"}]},
        # {"foreign": [{"value":"COUNTRIES__CONTINENT"},{"value":"CONTINENTS__CONTID"}]},
    # ]
    parser = argparse.ArgumentParser()
    parser.add_argument('-sql1', action='store', type=str, default='', help='The first sql to evaluate.')
    parser.add_argument('-sql2', action='store', type=str, default='', help='The second sql to evaluate.')
    parser.add_argument('-schema', action='store', type=str, default='\{\}', help='The schema used to evaluate.')
    parser.add_argument('-constraint', action='store', type=str, default='[]', help='The constraint used to evaluate.')
    parser.add_argument('-ROW_NUM', action='store', type=int, default=2, help='The bound size used to evaluate.')
    parser.add_argument('-timeout', action='store', type=int, default=20, help='Timeout (s).')
    args = parser.parse_args()
    # generate_code: generate SQL code and running outputs if it finds a counterexample
    # timer: show time costs
    # show_counterexample: print counterexample?
    # args_.schema = "{'STADIUM': {'STADIUM_ID': 'INT', 'LOCATION': 'VARCHAR', 'NAME': 'VARCHAR', 'CAPACITY': 'INT', 'HIGHEST': 'INT', 'LOWEST': 'INT', 'AVERAGE': 'INT'}, 'SINGER': {'SINGER_ID': 'INT', 'NAME': 'VARCHAR', 'COUNTRY': 'VARCHAR', 'SONG_NAME': 'VARCHAR', 'SONG_RELEASE_YEAR': 'INT', 'AGE': 'INT', 'IS_MALE': 'BOOL'}, 'CONCERT': {'CONCERT_ID': 'INT', 'CONCERT_NAME': 'VARCHAR', 'THEME': 'VARCHAR', 'STADIUM_ID': 'INT', 'YEAR': 'INT'}, 'SINGER_IN_CONCERT': {'CONCERT_ID': 'INT', 'SINGER_ID': 'INT'}}"
    # args_.constraint = "[{'primary': [{'value': 'STADIUM__STADIUM_ID'}]}, {'primary': [{'value': 'SINGER__SINGER_ID'}]}, {'primary': [{'value': 'CONCERT__CONCERT_ID'}]}, {'primary': [{'value': 'SINGER_IN_CONCERT__CONCERT_ID'}, {'value': 'SINGER_IN_CONCERT__SINGER_ID'}]}, {'foreign': [{'value': 'CONCERT__STADIUM_ID'}, {'value': 'STADIUM__STADIUM_ID'}]}, {'foreign': [{'value': 'SINGER_IN_CONCERT__SINGER_ID'}, {'value': 'SINGER__SINGER_ID'}]}, {'foreign': [{'value': 'SINGER_IN_CONCERT__CONCERT_ID'}, {'value': 'CONCERT__CONCERT_ID'}]}]"
    # args_.sql1 = "select t2.name ,  t2.capacity from concert as t1 join stadium as t2 on t1.stadium_id  =  t2.stadium_id where t1.year  >  2013 group by t2.stadium_id order by count(*) desc limit 1;"
    # args_.sql2 = "SELECT DISTINCT stadium.name, stadium.capacity FROM stadium JOIN concert ON stadium.stadium_id = concert.stadium_id WHERE concert.year > 2013 GROUP BY stadium.stadium_id ORDER BY COUNT(concert.concert_id) DESC LIMIT 1;"
    config = {'generate_code': True, 'timer': True, 'show_counterexample': True}
    main(args.sql1, 
         args.sql2, 
         ast.literal_eval(args.schema), 
         ROW_NUM=args.ROW_NUM,
         timeout=args.timeout,
         constraints=ast.literal_eval(args.constraint), 
         **config)