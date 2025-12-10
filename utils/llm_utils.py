import os
import openai
import asyncio
import time
from typing import List, Tuple
from concurrent.futures import ThreadPoolExecutor
from dotenv import load_dotenv

load_dotenv(override=True)
openai.api_base = os.getenv("OPENAI_API_BASE")
openai.api_key = os.getenv("OPENAI_API_KEY")
print("Config openai API KEY!")


GPT_MAX_TRIALS = 5

GPT_O1 = "o1"
GPT_4_TURBO = "gpt-4-turbo"  # gpt-4-turbo-2024-04-09
GPT_4O = "gpt-4o"  # gpt-4o-2024-08-06
GPT_3_5_TURBO = "gpt-3.5-turbo"
CLAUDE_3_5 = "anthropic/claude-3.5-sonnet"


async def gpt_reply_n(messages, model, n=1, temperature=1.0):
    """Process n calls to gpt_reply in parallel"""
    if model in [GPT_O1, CLAUDE_3_5]:
        n = 1
    
    async def process_single_reply():
        """Process a single gpt_reply call asynchronously"""
        loop = asyncio.get_event_loop()
        with ThreadPoolExecutor() as pool:
            response = await loop.run_in_executor(
                pool,
                lambda: gpt_reply(messages=messages, model=model, temperature=temperature)
            )
        return response
    
    tasks = [process_single_reply() for _ in range(n)]
    return await asyncio.gather(*tasks)


def gpt_reply(messages, model, temperature=1.0):
    try:
        completions = openai.ChatCompletion.create(
            model=model,
            messages=messages,
            temperature=temperature,
            n=1
        )
    except Exception as e:
        print("GPT exception: %s" % e)
        return None
    res = completions.choices[0].message.content

    return res


def gpt_reply_n_with_log_prob(messages, model, n=1, temperature=1.0):
    if model in [GPT_O1, CLAUDE_3_5]:
        n = 1
    try:
        completions = openai.ChatCompletion.create(
            model=model,
            messages=messages,
            n=n,
            logprobs=True,
            temperature=temperature,
            top_logprobs=3
        )
    except Exception as e:
        print("GPT exception: %s" % e)
        return None

    # [("response1", [prob1, prob2, ...]), ]
    res = []
    for i in range(n):
        token_logprob_list = [(record['token'], record['logprob']) for record in completions.choices[i].logprobs.content]
        res.append((completions.choices[i].message.content, token_logprob_list))

    return res
