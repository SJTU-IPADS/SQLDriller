import json
import matplotlib.pyplot as plt

from utils.stat_utils import get_error_cases, get_error_ids, sampled_dev_cases, sampled_dev_schemas, sampled_train_cases


def draw(dev_error_ids: list, train_error_ids: list):
    with open("spider_data/dev.json", "r") as f:
        dev_cases = json.load(f)

    with open("spider_data/train.json", "r") as f:
        train_cases = json.load(f)

    dev_count = {}
    dev_total_count = {}
    for i in range(sampled_dev_cases):
        db_id = dev_cases[i]["db_id"]
        if db_id in dev_total_count:
            dev_total_count[db_id] += 1
        else:
            dev_total_count[db_id] = 1

        if i in dev_error_ids and db_id in sampled_dev_schemas:
            if db_id in dev_count:
                dev_count[db_id] += 1
            else:
                dev_count[db_id] = 1

    for key in dev_count:
        dev_count[key] = dev_count[key] / dev_total_count[key]

    train_count = {}
    train_total_count = {}
    for i in range(sampled_train_cases):
        db_id = train_cases[i]["db_id"]
        if db_id in train_total_count:
            train_total_count[db_id] += 1
        else:
            train_total_count[db_id] = 1

        if i in train_error_ids:
            if db_id in train_count:
                train_count[db_id] += 1
            else:
                train_count[db_id] = 1

    for key in train_total_count:
        train_count[key] = train_count[key] / train_total_count[key]

    # output the error rate
    print("\033[91mError rate for the sampled dev schemas:\033[0m")
    for schema in dev_count:
        print(f'{schema}:\t{"{:.1%}".format(dev_count[schema])}')
    # print("\033[91mError cases for the sampled dev schemas:\033[0m")
    # print(", ".join(str(item) for item in dev_error_ids))
    print("\033[91mError rate for the sampled training schemas:\033[0m")
    for schema in train_count:
        print(f'{schema}:\t{"{:.1%}".format(train_count[schema])}')
    # print("\033[91mError cases for the sampled training schemas:\033[0m")
    # print(", ".join(str(item) for item in train_error_ids))

    
    # draw pdf
    x_catagories = ["s$_{t0}$", "s$_{t1}$", "s$_{t2}$", "s$_{t3}$", "s$_{t4}$", "s$_{t5}$", "s$_{t6}$", "s$_{t7}$",
                    "s$_{t8}$", "s$_{t9}$", "s$_{d0}$", "s$_{d1}$", "s$_{d2}$", "s$_{d3}$", "s$_{d4}$"]
    colors = {'train': '#9ac9db', 'dev': '#4995c6'}
    colors_ = [colors['train'] for _ in range(10)]
    colors_.extend([colors['dev'] for _ in range(5)])
    values = list(dev_count.values())
    values.extend(list(train_count.values()))
    # print(sum(values) / len(values))

    bars = plt.bar(x_catagories, values, color=colors_)
    for bar in bars:
        height = bar.get_height()
        plt.text(bar.get_x() + bar.get_width() / 2.0, height, f'{height * 100:.1f}%', ha='center', va='bottom',
                 fontsize=14, rotation=90)

    handles = [plt.Rectangle((0, 0), 1, 1, color=colors[c], linewidth=6) for c in colors]
    plt.tick_params(axis='y', labelsize=16)
    plt.tick_params(axis='x', labelsize=16)
    plt.ylim(0, 0.65)
    labels = list(colors.keys())
    plt.legend(handles, labels, frameon=False, prop={'size': 12})
    plt.ylabel('Error rate', fontsize=20)
    plt.xlabel('Schemas', fontsize=20)
    plt.tight_layout()
    plt.savefig("plots/Figure2:error_per_schema.pdf")
    plt.close()


if __name__ == "__main__":
    dev_error_cases = get_error_cases("dev", True)
    train_error_cases = get_error_cases("train", True)
    dev_error_ids = dev_error_cases["case id"].tolist()
    train_error_ids = train_error_cases["case id"].tolist()
    draw(dev_error_ids, train_error_ids)
    
