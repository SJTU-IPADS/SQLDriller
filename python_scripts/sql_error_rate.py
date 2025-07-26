import json
import os
import statistics
import matplotlib.pyplot as plt
import numpy as np


def get_error_rates(sql_fix_file_path):
    with open(sql_fix_file_path, "r") as f:
        items = json.load(f)

    error_count_by_schema = {}
    total_count_by_schema = {}
    error_count_by_difficulty = {}
    total_count_by_difficulty = {}
    for i in range(len(items)):
        case_id, db_id, difficulty = items[i]["id"], items[i]["db_id"], items[i]["difficulty"]
        original, fixed = items[i]["original"], items[i]["fixed"]
        total_count_by_schema[db_id] = total_count_by_schema.get(db_id, 0) + 1
        total_count_by_difficulty[difficulty] = total_count_by_difficulty.get(difficulty, 0) + 1
        if fixed is not None:
            error_count_by_schema[db_id] = error_count_by_schema.get(db_id, 0) + 1
            error_count_by_difficulty[difficulty] = error_count_by_difficulty.get(difficulty, 0) + 1

    error_rate_by_schema = {}
    for key in total_count_by_schema:
        error_rate_by_schema[key] = error_count_by_schema.get(key, 0) / total_count_by_schema[key]

    error_rate_by_difficulty = {}
    for key in total_count_by_difficulty:
        error_rate_by_difficulty[key] = error_count_by_difficulty.get(key, 0) / total_count_by_difficulty[key]

    total_count = sum(total_count_by_schema.values())
    error_count = sum(error_count_by_schema.values())

    return total_count, error_count, \
        total_count_by_schema, error_count_by_schema, error_rate_by_schema, \
        total_count_by_difficulty, error_count_by_difficulty, error_rate_by_difficulty


if __name__ == "__main__":
    spider_sql_fix_file_path = "./data/spider/opt/train_sampled_all.json"
    spider_total_count, spider_error_count, \
        spider_train_total_count_by_schema, spider_train_error_count_by_schema, spider_train_error_rate_by_schema, \
        spider_train_total_count_by_difficulty, spider_train_error_count_by_difficulty, spider_train_error_rate_by_difficulty = \
        get_error_rates(spider_sql_fix_file_path)

    bird_sql_fix_file_path = "./data/bird/opt/train_sampled_all.json"
    bird_total_count, bird_error_count, \
        bird_train_total_count_by_schema, bird_train_error_count_by_schema, bird_train_error_rate_by_schema, \
        bird_train_total_count_by_difficulty, bird_train_error_count_by_difficulty, bird_train_error_rate_by_difficulty = \
        get_error_rates(bird_sql_fix_file_path)

    result_save_dir = "./results/study/error"
    os.makedirs(result_save_dir, exist_ok=True)

    # 1. Error rate by difficulty
    with open(os.path.join(result_save_dir, "Table1_error_rate_by_difficulty.txt"), "w") as f:
        f.write("Spider: total sampled count: {}, error count: {}, error rate: {:.3f}\n"
                .format(spider_total_count, spider_error_count, spider_error_count / spider_total_count))
        f.write("BIRD: total sampled count: {}, error count: {}, error rate: {:.3f}\n\n"
                .format(bird_total_count, bird_error_count, bird_error_count / bird_total_count))

        f.write("Difficulty\teasy\tmedium\thard\textra\n")
        f.write("Spider\t{:.3f} ({}/{})\t{:.3f} ({}/{})\t{:.3f} ({}/{})\t{:.3f} ({}/{})\n"
                .format(spider_train_error_rate_by_difficulty.get("easy", 0),
                        spider_train_error_count_by_difficulty.get("easy", 0),
                        spider_train_total_count_by_difficulty.get("easy", 0),
                        spider_train_error_rate_by_difficulty.get("medium", 0),
                        spider_train_error_count_by_difficulty.get("medium", 0),
                        spider_train_total_count_by_difficulty.get("medium", 0),
                        spider_train_error_rate_by_difficulty.get("hard", 0),
                        spider_train_error_count_by_difficulty.get("hard", 0),
                        spider_train_total_count_by_difficulty.get("hard", 0),
                        spider_train_error_rate_by_difficulty.get("extra", 0),
                        spider_train_error_count_by_difficulty.get("extra", 0),
                        spider_train_total_count_by_difficulty.get("extra", 0)))
        f.write("BIRD\t{:.3f} ({}/{})\t{:.3f} ({}/{})\t{:.3f} ({}/{})\t{:.3f} ({}/{})\n"
                .format(bird_train_error_rate_by_difficulty.get("easy", 0),
                        bird_train_error_count_by_difficulty.get("easy", 0),
                        bird_train_total_count_by_difficulty.get("easy", 0),
                        bird_train_error_rate_by_difficulty.get("medium", 0),
                        bird_train_error_count_by_difficulty.get("medium", 0),
                        bird_train_total_count_by_difficulty.get("medium", 0),
                        bird_train_error_rate_by_difficulty.get("hard", 0),
                        bird_train_error_count_by_difficulty.get("hard", 0),
                        bird_train_total_count_by_difficulty.get("hard", 0),
                        bird_train_error_rate_by_difficulty.get("extra", 0),
                        bird_train_error_count_by_difficulty.get("extra", 0),
                        bird_train_total_count_by_difficulty.get("extra", 0)))

    # 2. Error rate by schema
    # Record max, min, median error rate
    with open(os.path.join(result_save_dir, "Figure2_error_rate_per_schema.txt"), "w") as f:
        f.write("Spider {} database schemas: \n".format(len(spider_train_error_rate_by_schema.keys())))
        f.write("max error rate: {:.3f}, min error rate: {:.3f}, median error rate: {:.3f}\n"
                .format(max(spider_train_error_rate_by_schema.values()),
                        min(spider_train_error_rate_by_schema.values()),
                        statistics.median(spider_train_error_rate_by_schema.values())))
        for schema, rate in spider_train_error_rate_by_schema.items():
            f.write("Schema {}: {:.3f}\n".format(schema, rate))

        f.write("\n")

        f.write("BIRD {} database schemas: \n".format(len(bird_train_error_rate_by_schema.keys())))
        f.write("max error rate: {:.3f}, min error rate: {:.3f}, median error rate: {:.3f}\n"
                .format(max(bird_train_error_rate_by_schema.values()),
                        min(bird_train_error_rate_by_schema.values()),
                        statistics.median(bird_train_error_rate_by_schema.values())))
        for schema, rate in bird_train_error_rate_by_schema.items():
            f.write("Schema {}: {:.3f}\n".format(schema, rate))

    # Draw Figure 2: error_per_schema
    hist1, bin_edges1 = np.histogram(list(spider_train_error_rate_by_schema.values()),  bins=len(spider_train_error_rate_by_schema.values()))
    cdf1 = np.cumsum(hist1 / sum(hist1))
    plt.plot(bin_edges1[1:], cdf1, color='#696969')

    hist2, bin_edges2 = np.histogram(list(bird_train_error_rate_by_schema.values()), bins=len(bird_train_error_rate_by_schema.values()))
    cdf2 = np.cumsum(hist2 / sum(hist2))
    plt.plot(bin_edges2[1:], cdf2, color='#3342FF')

    colors = {"BIRD": '#3342FF', "Spider": '#696969'}
    handles = [plt.Rectangle((0, 0), 1, 1, color=c, linewidth=6) for c in colors.values()]
    labels = list(colors.keys())
    plt.legend(handles, labels, frameon=False, prop={'size': 21})

    plt.rcParams['font.family'] = 'Arial Unicode MS'
    plt.grid(True, linestyle='--')
    plt.xlabel('Error rate', fontsize=28)
    plt.ylabel('CDF', fontsize=28)
    plt.tick_params(axis='y', labelsize=24)
    plt.tick_params(axis='x', labelsize=24)
    plt.tight_layout()
    plt.savefig(os.path.join(result_save_dir, "Figure2_error_rate_per_schema_cdf.pdf"))
    plt.close()

