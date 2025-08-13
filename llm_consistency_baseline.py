import argparse
import datetime
import json, os, random
import time

import pandas as pd
from tqdm import tqdm

from utils.constants import *
from utils.llm_utils import *
from utils.path_utils import METADATA_FILE_PATHS, SCHEMA_DB_DIR
from utils.prompt_utils import encode_schema_and_data_prompt

import asyncio
from typing import List, Tuple
from concurrent.futures import ThreadPoolExecutor


async def process_all_prompts(prompts: List[str], candidate_num) -> List[Tuple]:
    """Process all prompts in parallel"""
    async def process_prompt(prompt: str):
        """Process a single prompt asynchronously"""
        messages = [{"role": "user", "content": prompt}]

        trial = 0
        while trial < 3:
            loop = asyncio.get_event_loop()
            # with ThreadPoolExecutor(max_workers=MAX_WORKERS) as pool:
            with ThreadPoolExecutor() as pool:
                responses = await loop.run_in_executor(
                    pool,
                    lambda: gpt_reply_n_with_log_prob(messages=messages, model=GPT_4O, n=1, temperature=temperature)
                )
                del pool

            if responses is None:
                trial += 1
                time.sleep(15)
                continue

            response, token_logprob = responses[0]
            # print("trial %d's response: %s" % (trial, response))
            if len(token_logprob) > 10:
                print("abnormal response:", response)
                trial += 1
                continue

            for token, logprob in token_logprob:
                if token == "g":
                    return "g", logprob
                elif token.isdigit() and int(token) in range(0, candidate_num):
                    return int(token), logprob
            print("abnormal response:", response)
            trial += 1

        return None, None

    tasks = [process_prompt(prompt) for prompt in prompts]
    return await asyncio.gather(*tasks)


PROMPT_TEMPLATE_PATH = "utils/prompts/llm_consis_baseline/"
PROMPT_TEMPLATE_FILES = [f for f in os.listdir(PROMPT_TEMPLATE_PATH) if f.startswith("autogen_prompt_")]

TEMPLATE_SAMPLE_SIZE = 20
BATCH_SIZE = 5
MAX_WORKERS = 5
CHOSEN_TIMES_THRESHOLD = 2
temperature = 1.0


def get_multiple_prompts(schema_db_dir, db_id, nlq, evidence, infer_predictions, gold=None):
    prompts = []
    prompt_templates = []

    selected_template_files = sorted(random.sample(PROMPT_TEMPLATE_FILES, k=min(TEMPLATE_SAMPLE_SIZE, len(PROMPT_TEMPLATE_FILES))))
    for filename in selected_template_files:
        with open(os.path.join(PROMPT_TEMPLATE_PATH, filename), 'r') as f:
            prompt_templates.append(f.read().strip())

    for prompt_template in prompt_templates:
        all_sqls = infer_predictions if gold is None else infer_predictions + [gold]
        schema = encode_schema_and_data_prompt(db_id, all_sqls, schema_db_dir, None, concrete_data=False)

        sql_option_prompt = ""
        if gold is not None:  # Add gold SQL to the prompt
            sql_option_prompt += "\nThe original provided gold SQL is: %s\n" % gold
        sql_option_prompt += "\nThe candidate SQLs are: \n%s" % \
                             "\n".join([r"%d. %s" % (i, sql) for i, sql in enumerate(infer_predictions)])
        nlq_prompt = nlq + (("\nwhere:\n%s" % evidence) if evidence is not None else "")
        prompt = prompt_template % (schema, nlq_prompt, sql_option_prompt)

        prompt += "\n\nYou should always select only one best-suited SQL, ONLY output the id of the SQL, and DO NOT make any extra explanation. \n"
        if gold is not None:
            prompt += "First consider the original gold SQL matches or not. " \
                      "If you select the gold SQL, output 'g'. " \
                      "Else, only output the id of your chosen candidate SQL, for example, 0."
        else:
            prompt += "Please only output the id of your chosen SQL, for example, 0."
        prompts.append(prompt)

    return prompts


def infer_confidence_scores(schema_db_dir, db_id, nlq, evidence, infer_predictions, gold=None):
    confidence_score_list = {}

    prompts = get_multiple_prompts(schema_db_dir, db_id, nlq, evidence, infer_predictions, gold=gold)
    # Run async processing
    results = []
    for i in range(0, len(prompts), BATCH_SIZE):
        batch_prompts = prompts[i:i + BATCH_SIZE]
        batch_results = asyncio.run(process_all_prompts(batch_prompts, candidate_num=len(infer_predictions)))
        results.extend(batch_results)
        time.sleep(0.2 * BATCH_SIZE)

    # Process results
    for result_idx, confidence_score in results:
        if result_idx is not None:
            confidence_score_list.setdefault(result_idx, []).append(confidence_score)

    confidence_scores = {idx: (len(scores), sum(scores) / len(scores)) for idx, scores in confidence_score_list.items()}

    return confidence_scores


def log_exec_ce(log_dir, gold, preds, confidence_scores: dict):
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    llm_confidence_res_json = []
    with open(os.path.join(log_dir, "llm_confidence.json"), "w") as f:
        if gold is not None:
            if "g" in confidence_scores.keys():
                gold_res = {"gold": gold, "output times": confidence_scores["g"][0], "logprob": confidence_scores["g"][1]}
                llm_confidence_res_json.append(gold_res)
        for i in range(len(preds)):
            if i in confidence_scores.keys():
                pred_ces = {"pred": preds[i], "output times": confidence_scores[i][0], "logprob": confidence_scores[i][1]}
                llm_confidence_res_json.append(pred_ces)
        json.dump(llm_confidence_res_json, f, indent=2)


def evaluate(args):
    with open(args.sql_candidates_path) as f:
        candidate_items = json.load(f)

    os.makedirs(os.path.join(args.save_dir, "llmconsis_res"), exist_ok=True)

    sampled_case_ids = None
    if args.sample_case_reference_file is not None:
        sampled_case_records = pd.read_csv(args.sample_case_reference_file, sep='\t', usecols=['case_id']).to_dict(orient='records')
        sampled_case_ids = sorted([int(record['case_id']) for record in sampled_case_records])

    schema_db_dir = METADATA_FILE_PATHS[args.benchmark][refine_steps.original][SCHEMA_DB_DIR]

    for _, item in tqdm(enumerate(candidate_items)):
        case_id, db_id, nlq, gold = item['id'], item['db_id'], item['nlq'], item['gold']
        evidence = item['evidence'] if args.benchmark == benchmark_type.bird else None
        infer_predictions = item['infer_predictions'][0]

        # if str(args.save_subdir).startswith("llmconsis_bird_dev_sft_codes") and case_id not in sft_codes_patch_ids:
        #     continue
        # if str(args.save_subdir).startswith("llmconsis_bird_dev_codes") and case_id not in codes_patch_ids:
        #     continue

        if (args.start_id >= 0 and case_id < args.start_id) or (args.end_id >= 0 and case_id > args.end_id):
            continue

        if sampled_case_ids is not None and case_id not in sampled_case_ids:
            continue

        print("Check LLM consistency baseline for case %d" % case_id)

        log_dir = os.path.join(args.save_dir, "llmconsis_res", str(case_id))
        if len(infer_predictions) == 0:
            log_exec_ce(log_dir, gold, [], {})
            with open(os.path.join(args.save_dir, args.modified_gold_save_file), 'a') as f:
                if args.contain_gold:
                    # Refine dataset
                    f.write("%d\t%s\t%s\n" % (case_id, gold, "-"))
                else:
                    # Model inference
                    f.write("sql placeholder" + "\n")
            continue

        confidence_scores = infer_confidence_scores(schema_db_dir, db_id, nlq, evidence, infer_predictions, gold=gold if args.contain_gold else None)
        log_exec_ce(log_dir, gold, infer_predictions, confidence_scores)

        # Candidates chosen at least CHOSEN_TIMES_THRESHOLD times are concerned
        if len(confidence_scores) == 0:
            pred_idx = "g" if args.contain_gold else 0
        else:
            pred_idx = max(confidence_scores,
                           key=lambda x: confidence_scores.get(x)[1] if confidence_scores.get(x)[0] >= CHOSEN_TIMES_THRESHOLD
                           else float('-inf'))

        with open(os.path.join(args.save_dir, args.modified_gold_save_file), 'a') as f:
            if args.contain_gold:
                f.write("%d\t-1\t%s\t%s\n" % (case_id, gold, "-" if pred_idx == "g" else infer_predictions[pred_idx]))
            else:
                assert pred_idx != -1
                f.write(infer_predictions[pred_idx] + "\n")
                # f.write("%d\t%s" % (case_id, infer_predictions[pred_idx]) + "\n")

# sft_codes_patch_ids = [1, 4, 5, 7, 10, 16, 20, 34, 36, 38, 42, 45, 47, 52, 55, 57, 58, 59, 60, 61, 62, 64, 69, 71, 76, 87, 96, 104, 105, 110, 111, 117, 118, 119, 120, 121, 122, 123, 126, 127, 133, 135, 136, 139, 140, 143, 150, 152, 153, 154, 157, 159, 160, 162, 166, 170, 175, 179, 183, 187, 190, 191, 196, 200, 202, 203, 204, 205, 212, 213, 220, 221, 222, 224, 229, 230, 234, 235, 236, 238, 240, 241, 256, 261, 262, 265, 266, 272, 273, 274, 276, 278, 279, 282, 283, 286, 289, 291, 293, 295, 296, 297, 299, 300, 301, 305, 309, 313, 314, 315, 316, 318, 320, 322, 325, 331, 332, 333, 334, 336, 339, 340, 341, 342, 343, 345, 347, 348, 350, 355, 356, 357, 358, 359, 360, 361, 362, 363, 366, 368, 372, 373, 374, 375, 377, 378, 379, 380, 385, 388, 389, 393, 394, 395, 396, 397, 405, 409, 410, 411, 412, 413, 414, 419, 420, 422, 424, 425, 426, 427, 428, 429, 434, 435, 436, 438, 439, 440, 441, 442, 443, 449, 450, 451, 452, 453, 455, 456, 457, 460, 462, 463, 464, 465, 466, 467, 468, 470, 472, 476, 477, 478, 480, 481, 482, 485, 487, 488, 489, 490, 491, 492, 493, 494, 495, 498, 499, 500, 501, 502, 503, 504, 505, 508, 509, 510, 513, 516, 517, 521, 522, 524, 526, 527, 528, 529, 531, 532, 534, 535, 536, 537, 538, 539, 540, 542, 544, 545, 547, 548, 549, 551, 552, 553, 555, 556, 557, 558, 561, 562, 563, 564, 565, 566, 567, 568, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 581, 582, 584, 585, 586, 588, 589, 590, 591, 593, 594, 597, 598, 599, 600, 601, 602, 605, 606, 607, 608, 609, 610, 611, 612, 613, 615, 617, 619, 620, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 635, 636, 637, 638, 639, 640, 641, 643, 644, 645, 647, 648, 651, 655, 658, 660, 661, 663, 664, 665, 666, 667, 669, 671, 672, 674, 675, 676, 678, 680, 684, 685, 686, 687, 688, 689, 690, 691, 693, 694, 697, 699, 701, 702, 704, 705, 706, 709, 711, 712, 713, 714, 715, 718, 719, 721, 722, 723, 725, 727, 729, 731, 733, 734, 735, 737, 742, 744, 745, 747, 748, 750, 752, 754, 757, 759, 761, 764, 768, 770, 773, 774, 775, 776, 777, 779, 781, 784, 785, 787, 789, 791, 793, 795, 799, 801, 803, 804, 805, 806, 807, 808, 809, 811, 812, 815, 818, 822, 823, 827, 831, 833, 834, 835, 836, 838, 839, 841, 842, 844, 847, 848, 849, 853, 855, 856, 859, 861, 863, 868, 869, 870, 873, 874, 875, 876, 878, 879, 881, 883, 884, 886, 893, 895, 900, 902, 904, 909, 910, 912, 914, 917, 918, 919, 920, 923, 925, 932, 933, 935, 936, 939, 940, 941, 943, 945, 946, 947, 950, 952, 953, 960, 964, 968, 969, 978, 979, 980, 982, 987, 988, 991, 992, 993, 995, 997, 1005, 1008, 1017, 1018, 1022, 1029, 1033, 1034, 1035, 1036, 1039, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1051, 1053, 1054, 1055, 1056, 1059, 1060, 1063, 1065, 1066, 1067, 1068, 1070, 1071, 1072, 1073, 1074, 1077, 1078, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1091, 1095, 1096, 1097, 1098, 1099, 1100, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1115, 1116, 1122, 1123, 1125, 1129, 1130, 1134, 1138, 1139, 1140, 1141, 1143, 1144, 1147, 1150, 1151, 1153, 1154, 1155, 1159, 1161, 1162, 1164, 1165, 1167, 1172, 1173, 1176, 1177, 1179, 1180, 1181, 1184, 1188, 1192, 1193, 1194, 1198, 1203, 1205, 1206, 1210, 1215, 1220, 1222, 1229, 1230, 1234, 1237, 1240, 1244, 1246, 1251, 1256, 1258, 1261, 1262, 1269, 1270, 1277, 1280, 1283, 1286, 1287, 1298, 1299, 1301, 1304, 1305, 1310, 1312, 1313, 1314, 1315, 1317, 1320, 1326, 1328, 1329, 1330, 1331, 1333, 1334, 1337, 1340, 1341, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1351, 1352, 1353, 1354, 1355, 1356, 1357, 1360, 1361, 1362, 1364, 1365, 1368, 1370, 1371, 1372, 1374, 1375, 1377, 1378, 1379, 1380, 1381, 1383, 1388, 1393, 1394, 1395, 1400, 1401, 1405, 1408, 1409, 1411, 1412, 1414, 1415, 1416, 1423, 1424, 1425, 1427, 1428, 1430, 1432, 1434, 1435, 1436, 1437, 1438, 1439, 1441, 1443, 1445, 1446, 1447, 1458, 1459, 1461, 1464, 1466, 1468, 1469, 1470, 1471, 1476, 1483, 1485, 1487, 1489, 1491, 1492, 1493, 1496, 1497, 1500, 1501, 1502, 1504, 1505, 1507, 1508, 1509, 1514, 1515, 1518, 1520, 1521, 1522, 1528, 1533]
# codes_patch_ids = [3, 5, 6, 8, 10, 11, 20, 35, 38, 47, 52, 55, 58, 59, 60, 64, 71, 104, 105, 111, 120, 121, 122, 123, 127, 133, 135, 139, 140, 151, 152, 153, 154, 157, 162, 166, 202, 203, 204, 213, 216, 221, 222, 224, 235, 236, 238, 241, 256, 257, 259, 261, 266, 276, 286, 289, 291, 293, 295, 296, 300, 305, 309, 313, 314, 318, 320, 321, 323, 331, 332, 334, 336, 337, 342, 343, 345, 348, 350, 355, 356, 357, 358, 359, 360, 362, 366, 367, 372, 373, 374, 375, 377, 379, 380, 385, 388, 389, 390, 394, 395, 396, 397, 404, 411, 412, 419, 420, 422, 424, 425, 426, 427, 428, 429, 437, 439, 440, 441, 443, 449, 450, 451, 452, 453, 455, 456, 457, 460, 462, 463, 464, 466, 467, 468, 471, 472, 473, 477, 478, 480, 481, 482, 485, 486, 488, 489, 490, 491, 492, 493, 495, 497, 498, 500, 501, 502, 503, 504, 505, 508, 509, 510, 517, 522, 526, 527, 528, 531, 534, 535, 537, 538, 539, 540, 542, 544, 545, 547, 548, 549, 551, 552, 553, 555, 556, 557, 558, 562, 563, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 594, 599, 600, 601, 602, 606, 607, 608, 609, 610, 611, 612, 613, 617, 619, 620, 622, 624, 625, 627, 628, 630, 631, 632, 633, 635, 636, 637, 638, 639, 640, 643, 644, 645, 648, 649, 651, 654, 655, 658, 659, 660, 661, 663, 664, 666, 667, 671, 672, 674, 675, 676, 678, 680, 688, 689, 690, 691, 694, 696, 697, 699, 702, 703, 704, 705, 709, 711, 712, 713, 714, 715, 718, 720, 721, 722, 725, 726, 727, 729, 730, 731, 733, 734, 735, 737, 742, 744, 745, 747, 748, 750, 752, 754, 756, 757, 758, 760, 764, 768, 770, 772, 773, 774, 776, 777, 779, 781, 782, 784, 785, 787, 789, 791, 793, 795, 798, 800, 801, 802, 803, 804, 805, 806, 808, 809, 811, 812, 815, 823, 827, 831, 832, 833, 834, 836, 838, 841, 844, 849, 850, 851, 853, 858, 859, 861, 862, 863, 864, 868, 869, 873, 875, 878, 888, 893, 894, 895, 900, 902, 905, 907, 910, 912, 914, 916, 917, 918, 919, 920, 923, 929, 932, 933, 934, 936, 937, 941, 945, 946, 953, 957, 960, 961, 964, 965, 968, 971, 980, 982, 993, 995, 1005, 1008, 1017, 1022, 1025, 1029, 1033, 1035, 1041, 1042, 1043, 1045, 1046, 1047, 1048, 1049, 1053, 1054, 1056, 1057, 1059, 1060, 1062, 1063, 1065, 1066, 1067, 1069, 1070, 1071, 1072, 1073, 1077, 1079, 1080, 1081, 1082, 1084, 1086, 1089, 1091, 1095, 1096, 1097, 1098, 1099, 1100, 1102, 1103, 1104, 1105, 1106, 1108, 1109, 1111, 1112, 1113, 1122, 1129, 1130, 1133, 1138, 1139, 1140, 1141, 1144, 1153, 1164, 1172, 1176, 1177, 1178, 1179, 1180, 1184, 1194, 1195, 1203, 1205, 1206, 1210, 1212, 1240, 1246, 1270, 1274, 1277, 1283, 1297, 1305, 1310, 1312, 1313, 1314, 1319, 1320, 1325, 1326, 1328, 1329, 1330, 1333, 1334, 1335, 1337, 1338, 1341, 1344, 1345, 1346, 1347, 1348, 1349, 1351, 1352, 1353, 1354, 1355, 1356, 1361, 1362, 1365, 1368, 1370, 1372, 1373, 1375, 1377, 1380, 1381, 1383, 1386, 1393, 1394, 1397, 1401, 1405, 1409, 1414, 1415, 1416, 1423, 1424, 1425, 1430, 1434, 1435, 1436, 1438, 1441, 1443, 1445, 1446, 1459, 1461, 1464, 1466, 1468, 1469, 1470, 1471, 1476, 1484, 1485, 1489, 1491, 1493, 1496, 1500, 1501, 1504, 1505, 1506, 1507, 1508, 1509, 1515, 1516, 1518, 1520, 1521, 1523, 1526, 1533]


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--start_id", type=int, default=-1)
    parser.add_argument("--end_id", type=int, default=-1)

    parser.add_argument("--sql_candidates_path", type=str, required=True)
    parser.add_argument("--contain_gold", action="store_true")
    parser.add_argument("--sample_case_reference_file", type=str)

    parser.add_argument("--benchmark", type=str, default=benchmark_type.spider)
    parser.add_argument("--dataset_type", type=str, default=dataset_type.train)

    parser.add_argument("--save_dir", type=str, required=True)
    parser.add_argument("--modified_gold_save_file", type=str, default="modified_gold.tsv")
    args = parser.parse_args()

    for path_key in vars(args).keys():
        if path_key in ["sql_candidates_path"]:
            if not os.path.exists(vars(args)[path_key]):
                print(f"args.{path_key}: `{vars(args)[path_key]}` does not exist. Please check carefully.")
                exit(1)

    os.makedirs(args.save_dir, exist_ok=True)

    evaluate(args)
