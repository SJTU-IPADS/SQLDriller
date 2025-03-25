import matplotlib.pyplot as plt
import numpy as np

models = ["DAIL-SQL", "DIN-SQL", "RESDSQL", "Graphix-T5", "SFT CODES", "CODES"]
fixed_training_set = [3.7, 3.2, 7.2, 3.6, 6.5, 3.3]
fixed_training_set_with_ec = [9.2, 9.1, 6.4, 0.0, 4.7, 2.8]

llm_consis_baseline = [-0.2, -0.6, 2.7, 0.0, 0.3, -0.2]  # -0.1 -> -0.2

x = np.arange(len(models))

Graphix_T5_index = 3

# 柱子的宽度
width = 0.37

# 绘制柱状图
# fig, ax = plt.subplots()  # 6.4 * 4.8

# 设置画布大小，宽度为 10，高度为 6
fig, ax = plt.subplots(figsize=(7.0, 4.5))

current_figsize = fig.get_size_inches()  # 获取当前的 figsize
print(f"Current figsize: {current_figsize[0]} inches wide by {current_figsize[1]} inches tall")


# 绘制第一段
x_1 = x - width / 2 - 0.02
x_1[Graphix_T5_index] = x[Graphix_T5_index]
rects1 = ax.bar(x_1, fixed_training_set, width,
                label='Fixed Training Dataset', color='#6A99D0', edgecolor='#6A99D0', linewidth=0.5)
for i in range(len(rects1)):
    if i in [Graphix_T5_index]:
        continue
    rect = rects1[i]
    height = rect.get_height()
    ax.plot([rect.get_x(), rect.get_x() + rect.get_width() + rect.get_width() + 0.05], [height, height],
            color='grey', linewidth=1.2, linestyle='--')  # Draw line on top

# 绘制第二段（堆叠在第一段上）
rects2 = ax.bar(x_1, fixed_training_set_with_ec, width,
                bottom=fixed_training_set, label='w/ EC', color='#B4C7E7', edgecolor='#B4C7E7', linewidth=0.5)

# 绘制第三段: LLM consis baseline
x_3 = x + width / 2 + 0.02
x_3[Graphix_T5_index] = x[Graphix_T5_index]
rects3 = ax.bar(x_3, fixed_training_set, width, color='#6A99D0', edgecolor='#6A99D0', linewidth=0.5)
rects4 = ax.bar(x_3, llm_consis_baseline, width,
                bottom=fixed_training_set, label='w/ LC (baseline)', color='#E3E3E3', edgecolor='#E3E3E3', linewidth=0.5)


# 添加一些文本标签
ax.set_ylabel('Accuracy Improvement (%)', fontsize=16)
ax.set_xticks(x)
ax.set_xticklabels(models, rotation=20, fontsize=12)  # 旋转标签
# ax.legend(loc='upper left', fontsize=9, ncol=1)
# 设置图例
# ax.legend(loc='upper left', fontsize=9, ncol=3, handletextpad=1.0, labelspacing=1.0)

# 手动调整图例位置
handles, labels = ax.get_legend_handles_labels()
# 将 Fixed Training Set 放在第一行，其他两个放在第二行
legend1 = ax.legend([handles[0]], [labels[0]], loc='upper left', fontsize=9, bbox_to_anchor=(0, 1), frameon=False)  # 第一行
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
        adjusted_height_sum = (height_sum + 0.1) if eq(rect.get_height(), -0.2) else height_sum
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


autolabel_value(rects1, heights=[0] * len(fixed_training_set))
autolabel_value(rects2, heights=fixed_training_set, ignore_index=[Graphix_T5_index])
# autolabel_no_value(rects3)
autolabel_value(rects4, heights=fixed_training_set, ignore_index=[Graphix_T5_index])
for bar, value in zip(rects4, llm_consis_baseline):
    if value < 0:
        bar.set_hatch('///')
        bar.set_color('white')
        # bar.set_edgecolor('#6A99D0')
        bar.set_edgecolor('#A8A8A8')

# 调整 y 轴范围以确保数字不会超过图表的最上方
max_height = max([sum(x) for x in zip(fixed_training_set, fixed_training_set_with_ec)])
ax.set_ylim(0, max_height * 1.25)  # 增加 10% 的空间


line_position = x[3] * 0.5 + x[4] * 0.5  # 计算虚线的位置
ax.axvline(line_position, color='gray', linestyle='--', linewidth=1.0)  # 添加虚线

# 添加子标题
ax.text(line_position - 0.7, 15.2, 'Spider Test', ha='center', fontsize=12)
ax.text(x[5] + 0.1, 15.2, 'BIRD Dev', ha='center', fontsize=12)

plt.rcParams['font.family'] = 'Arial Unicode MS'
fig.tight_layout(pad=1.0)
plt.savefig("fig/accuracy_improvement_with_baseline.pdf")
plt.close()
