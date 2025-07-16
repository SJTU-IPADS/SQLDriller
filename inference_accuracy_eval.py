import argparse
import os.path
import matplotlib.pyplot as plt
import numpy as np


models = ['dail', 'din', 'resd', 'graphix-T5', 'sftcodes', 'codes']
spider_models = ['dail', 'din', 'resd', 'graphix-T5']
bird_models = ['sftcodes', 'codes']

original_train_tag = "original_train"
refined_train_tag = "refined_train"
opt_SQLDriller_tag = "opt_SQLDriller"
opt_llmconsis_tag = "opt_llmconsis"


def visualize_accuracy_improvement(stats: dict, save_file):
    with open(save_file, 'w') as f:
        f.write("Text-to-SQL model accuracy improvements.")
        f.write("Model\tDataset\t|\tAccuracy Improvement (%%)\teasy/simple\tmedium/moderate\thard/challenging\textra\n")

    for model in models:
        benchmark = "Spider" if model in spider_models else "BIRD"
        dataset = "Spider test" if model in spider_models else "BIRD dev"
        results = stats[model]
        accuracy_original_train, accuracy_refined_train, accuracy_opt_SQLDriller, accuracy_opt_llmconsis = \
            results[original_train_tag], results[refined_train_tag], results[opt_SQLDriller_tag], results[opt_llmconsis_tag]

        if model == 'graphix-T5':
            accuracy_opt_SQLDriller = accuracy_refined_train

        level1 = "easy" if benchmark == "Spider" else "simple"
        level2 = "medium" if benchmark == "Spider" else "moderate"
        level3 = "hard" if benchmark == "Spider" else "challenging"
        level4 = "extra"
        with open(save_file, 'a') as f:
            f.write("%s\t%s\t|" % (model, dataset))
            f.write("\t%.1f (%.1f -> %.1f)" % (accuracy_opt_SQLDriller['all'] - accuracy_original_train['all'],
                                               accuracy_original_train['all'], accuracy_opt_SQLDriller['all']))
            f.write("\t%.1f (%.1f -> %.1f)" % (accuracy_opt_SQLDriller[level1] - accuracy_original_train[level1],
                                               accuracy_original_train[level1], accuracy_opt_SQLDriller[level1]))
            f.write("\t%.1f (%.1f -> %.1f)" % (accuracy_opt_SQLDriller[level2] - accuracy_original_train[level2],
                                               accuracy_original_train[level2], accuracy_opt_SQLDriller[level2]))
            f.write("\t%.1f (%.1f -> %.1f)" % (accuracy_opt_SQLDriller[level3] - accuracy_original_train[level3],
                                               accuracy_original_train[level3], accuracy_opt_SQLDriller[level3]))
            if benchmark == "Spider":
                f.write("\t%.1f (%.1f -> %.1f)" % (accuracy_opt_SQLDriller[level4] - accuracy_original_train[level4],
                                                   accuracy_original_train[level4], accuracy_opt_SQLDriller[level4]))
            else:
                f.write("\t/")
            f.write("\n")


def visualize_accuracy_breakdown(stats: dict, save_file):
    accuracy_list_refined_train = []
    accuracy_delta_list_opt_SQLDriller = []
    accuracy_delta_list_opt_llmconsis = []

    for model in models:
        results = stats[model]
        accuracy_original_train = results['original_train']['all']
        accuracy_refined_train = results['refined_train']['all']
        accuracy_opt_SQLDriller = results['opt_SQLDriller']['all']
        accuracy_opt_llmconsis = results['opt_llmconsis']['all']

        # accuracy_list_refined_train.append(float(format(accuracy_refined_train - accuracy_original_train, ".1f")))
        accuracy_list_refined_train.append(accuracy_refined_train - accuracy_original_train)
        accuracy_delta_list_opt_SQLDriller.append(accuracy_opt_SQLDriller - accuracy_refined_train)
        accuracy_delta_list_opt_llmconsis.append(accuracy_opt_llmconsis - accuracy_refined_train)

    fig_accuracy_breakdown(models,
                           accuracy_list_refined_train,
                           accuracy_delta_list_opt_SQLDriller,
                           accuracy_delta_list_opt_llmconsis,
                           save_file)


def fig_accuracy_breakdown(model_list,
                           accuracy_list_refined_train,
                           accuracy_delta_list_opt_SQLDriller,
                           accuracy_delta_list_opt_llmconsis,
                           save_file):
    x = np.arange(len(model_list))
    Graphix_T5_index = 3
    width = 0.37  # 柱子的宽度

    # 绘制柱状图
    # fig, ax = plt.subplots()  # 6.4 * 4.8

    # 设置画布大小，宽度为 10，高度为 6
    fig, ax = plt.subplots(figsize=(7.0, 4.5))

    current_figsize = fig.get_size_inches()  # 获取当前的 figsize
    print(f"Current figsize: {current_figsize[0]} inches wide by {current_figsize[1]} inches tall")

    # 绘制第一段
    x_1 = x - width / 2 - 0.02
    x_1[Graphix_T5_index] = x[Graphix_T5_index]
    rects1 = ax.bar(x_1, accuracy_list_refined_train, width,
                    label='Fixed Training Dataset', color='#6A99D0', edgecolor='#6A99D0', linewidth=0.5)
    for i in range(len(rects1)):
        if i in [Graphix_T5_index]:
            continue
        rect = rects1[i]
        height = rect.get_height()
        ax.plot([rect.get_x(), rect.get_x() + rect.get_width() + rect.get_width() + 0.05], [height, height],
                color='grey', linewidth=1.2, linestyle='--')  # Draw line on top

    # 绘制第二段（堆叠在第一段上）
    rects2 = ax.bar(x_1, accuracy_delta_list_opt_SQLDriller, width,
                    bottom=accuracy_list_refined_train, label='w/ EC', color='#B4C7E7', edgecolor='#B4C7E7',
                    linewidth=0.5)

    # 绘制第三段: LLM consis baseline
    x_3 = x + width / 2 + 0.02
    x_3[Graphix_T5_index] = x[Graphix_T5_index]
    rects3 = ax.bar(x_3, accuracy_list_refined_train, width, color='#6A99D0', edgecolor='#6A99D0', linewidth=0.5)
    rects4 = ax.bar(x_3, accuracy_delta_list_opt_llmconsis, width,
                    bottom=accuracy_list_refined_train, label='w/ LC (baseline)', color='#E3E3E3', edgecolor='#E3E3E3',
                    linewidth=0.5)

    # 添加一些文本标签
    ax.set_ylabel('Accuracy Improvement (%)', fontsize=16)
    ax.set_xticks(x)
    ax.set_xticklabels(model_list, rotation=20, fontsize=12)  # 旋转标签
    # ax.legend(loc='upper left', fontsize=9, ncol=1)
    # 设置图例
    # ax.legend(loc='upper left', fontsize=9, ncol=3, handletextpad=1.0, labelspacing=1.0)

    # 手动调整图例位置
    handles, labels = ax.get_legend_handles_labels()
    # 将 Fixed Training Set 放在第一行，其他两个放在第二行
    legend1 = ax.legend([handles[0]], [labels[0]], loc='upper left', fontsize=9, bbox_to_anchor=(0, 1),
                        frameon=False)  # 第一行
    legend2 = ax.legend(handles[1:], labels[1:], loc='upper left', fontsize=9, ncol=2, bbox_to_anchor=(0, 0.95),
                        handletextpad=0.8, labelspacing=1.0, frameon=False)  # 第二行
    ax.add_artist(legend1)
    ax.add_artist(legend2)

    ax.tick_params(axis='y', labelsize=12)

    # 自动标注每个柱子上的值
    def autolabel_value(rects, heights, ignore_index=None):
        def eq(height, target_value):
            return abs(height - target_value) < 1e-5

        """在每个柱子上方标注其高度"""
        for i in range(len(rects)):
            rect, height = rects[i], heights[i]
            if ignore_index is not None and i in ignore_index:
                continue
            # for rect, height in zip(rects, heights):
            height_sum = rect.get_height() + height
            # adjusted_height_sum = (height_sum + 0.1) if eq(rect.get_height(), -0.2) else height_sum
            adjusted_height_sum = height_sum
            if rect.get_height() < 0:
                ax.annotate(f'{adjusted_height_sum:.1f}',
                            xy=(rect.get_x() + rect.get_width() / 2, height_sum),
                            xytext=(0, -5),  # 5 points vertical offset
                            textcoords="offset points",
                            ha='center', va='top', fontsize=10)
            else:
                ax.annotate(f'{height_sum:.1f}',
                            xy=(rect.get_x() + rect.get_width() / 2, height_sum),
                            xytext=(0, 3),  # 3 points vertical offset
                            textcoords="offset points",
                            ha='center', va='bottom', fontsize=10)

    autolabel_value(rects1, heights=[0] * len(accuracy_list_refined_train))
    autolabel_value(rects2, heights=accuracy_list_refined_train, ignore_index=[Graphix_T5_index])
    # autolabel_no_value(rects3)
    autolabel_value(rects4, heights=accuracy_list_refined_train, ignore_index=[Graphix_T5_index])
    for bar, value in zip(rects4, accuracy_delta_list_opt_llmconsis):
        if value < 0:
            bar.set_hatch('///')
            bar.set_color('white')
            # bar.set_edgecolor('#6A99D0')
            bar.set_edgecolor('#A8A8A8')

    # 调整 y 轴范围以确保数字不会超过图表的最上方
    max_height = max([sum(x) for x in zip(accuracy_list_refined_train, accuracy_delta_list_opt_SQLDriller)])
    ax.set_ylim(0, max_height * 1.25)  # 增加 10% 的空间

    line_position = x[3] * 0.5 + x[4] * 0.5  # 计算虚线的位置
    ax.axvline(line_position, color='gray', linestyle='--', linewidth=1.0)  # 添加虚线

    # 添加子标题
    ax.text(line_position - 0.7, 15.2, 'Spider Test', ha='center', fontsize=12)
    ax.text(x[5] + 0.1, 15.2, 'BIRD Dev', ha='center', fontsize=12)

    plt.rcParams['font.family'] = 'Arial Unicode MS'
    fig.tight_layout(pad=1.0)
    plt.savefig(save_file)
    plt.close()


def get_statistics(res_dir):
    # The end of each evaluation result tsv file:
    # {'all': xx, 'easy': xx, ...}, eval(dict) to get the data
    stats = {}
    for model in models:
        stats[model] = {}
        for tag in [original_train_tag, refined_train_tag, opt_SQLDriller_tag, opt_llmconsis_tag]:
            with open(os.path.join(res_dir, model, f"{model}_{tag}.tsv"), 'r') as f:
                contents = f.readlines()
                stats[model][tag] = eval(contents[-1].strip())

    return stats


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--save_dir", type=str, required=True)
    args = parser.parse_args()

    for path_key in vars(args).keys():
        if path_key in ["save_dir"]:
            if not os.path.exists(vars(args)[path_key]):
                print(f"args.{path_key}: `{vars(args)[path_key]}` does not exist. Please check carefully.")
                exit(1)

    stats = get_statistics(args.save_dir)

    accuracy_improvement_save_file = os.path.join(args.save_dir, "accuracy_improvement.tsv")
    visualize_accuracy_improvement(stats, accuracy_improvement_save_file)

    accuracy_breakdown_save_file = os.path.join(args.save_dir, "Figure11_accuracy_improvement_breakdown.pdf")
    visualize_accuracy_breakdown(stats, accuracy_breakdown_save_file)
