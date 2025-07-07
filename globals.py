import os
import time
import openai
from dotenv import load_dotenv

load_dotenv(override=True)
openai.api_base = os.getenv("OPENAI_API_BASE")
openai.api_key = os.getenv("OPENAI_API_KEY")
print("Config openai API KEY!")


CURRENT_REFINE_STEP = None


def set_refine_step(refine_step: str):
    global CURRENT_REFINE_STEP
    CURRENT_REFINE_STEP = refine_step

# TODO: remove global log, CURRENT_CASE_ID, CURRENT_REFINE_STEP
'''
GPT output logger
'''
# LOG_DIR = "./logs/"
# LOG_SUBDIR = ""
# CURRENT_CASE_ID = -1


# def log_gpt(task_name, prompt, reply_list):
#     case_dir = os.path.join(LOG_DIR, LOG_SUBDIR, str(CURRENT_CASE_ID))
#     if not os.path.exists(case_dir):
#         os.makedirs(case_dir)
#     with open(os.path.join(case_dir, task_name + str(int(time.time())) + ".txt"), "w") as f:
#         f.write("----------CURRENT_PROMPT----------\n" + prompt + "\n")
#         for i in range(len(reply_list)):
#             f.write("----------REPLY %d----------\n" % i + reply_list[i] + "\n")
#         f.write("----------END----------\n")
#
#
# def log_exception(stack_trace):
#     case_dir = os.path.join(LOG_DIR, LOG_SUBDIR, str(CURRENT_CASE_ID))
#     if not os.path.exists(case_dir):
#         os.makedirs(case_dir)
#     with open(os.path.join(case_dir, "exception" + str(int(time.time())) + ".txt"), "w") as f:
#         f.write("----------STACK TRACE----------\n" + stack_trace + "\n")
#         f.write("----------END----------\n")
