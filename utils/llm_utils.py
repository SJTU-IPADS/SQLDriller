import openai

GPT_MAX_TRIALS = 5

GPT_O1 = "o1-preview"
GPT_4_TURBO = "gpt-4-turbo"  # gpt-4-turbo-2024-04-09
GPT_4O = "gpt-4o"  # gpt-4o-2024-08-06
GPT_3_5_TURBO = "gpt-3.5-turbo"
CLAUDE_3_5 = "claude-3-5"


def gpt_reply_n(messages, model, n=1, temperature=1.0):
    if model in [GPT_O1, CLAUDE_3_5]:
        n = 1
    try:
        completions = openai.ChatCompletion.create(
            model=model,
            messages=messages,
            temperature=temperature,
            n=n
        )
    except Exception as e:
        print("GPT exception: %s" % e)
        return None
    res = [completions.choices[i].message.content for i in range(n)]

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
