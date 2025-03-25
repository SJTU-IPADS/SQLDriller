# -*- coding: utf-8 -*-

import argparse
import os

import ujson

from constants import STATE

__TASK = ['coverage', 'coverage_no_ic', 'distribution']

parser = argparse.ArgumentParser(description='Counter.')
parser.add_argument('-f', '--filenames', nargs='+', type=str, required=True,
                    help="The input filename of experimental results (in the format of *.csv).")
parser.add_argument('-a', '--aux_filename', type=str,
                    help="The input filename of RQ1 experimental results (in the format of *.csv).")
parser.add_argument('-t', '--task', type=str, required=True, choices=__TASK,
                    help=f"The task of plotting must be in {__TASK}.")
parser.add_argument('-o', '--output_file', type=str, required=True,
                    help="The output directory of a specified task.")
args = parser.parse_args()


def is_checked(states):
    return all(s == STATE.EQUIV for s in states[:-1]) and \
        states[-1] in {STATE.EQUIV, STATE.TIMEOUT, STATE.OOM}


def is_refuted(states):
    return states[-1] == STATE.NON_EQUIV


def get_workload(filename):
    workload = os.path.basename(filename)
    workload = workload[:workload.find('.')]
    if workload.endswith('_no_IC'):
        workload = workload[:-len('_no_IC')]
    if workload == 'literature':
        workload = 'Literature'
    elif workload == 'leetcode':
        workload = 'LeetCode'
    elif workload == 'calcite':
        workload = 'Calcite'
    return workload


def count_coverage(args):
    heads = ["tool", "workload", "unsupported", "checked", "not checked"]
    baselines = {
        ("Cosette", "LeetCode"): [23994, 0, 0],
        ("Cosette", "Calcite"): [397, 0, 0],
        ("Cosette", "Literature"): [8, 23, 33],
        ("Qex", "LeetCode"): [23994, 0, 0],
        ("Qex", "Calcite"): [397, 0, 0],
        ("Qex", "Literature"): [8, 29, 27],
        ("SPES", "LeetCode"): [23739, 52, 203],
        ("SPES", "Calcite"): [397, 0, 0],
        ("SPES", "Literature"): [33, 8, 23],
        ("HoTTSQL", "LeetCode"): [23994, 0, 0],
        ("HoTTSQL", "Calcite"): [397, 0, 0],
        ("HoTTSQL", "Literature"): [43, 21, 0],
        ("DataFiller", "LeetCode"): [10722, 13162, 110],
        ("DataFiller", "Calcite"): [0, 394, 3],
        ("DataFiller", "Literature"): [0, 43, 21],
        ("XData", "LeetCode"): [19028, 2927, 0],
        ("XData", "Calcite"): [397, 0, 0],
        ("XData", "Literature"): [26, 37, 1],
    }

    with open(args.output_file, 'w') as writer:
        print(','.join(heads), file=writer)
        for filename in args.filenames:
            with open(filename, 'r') as reader:
                workload = get_workload(filename)
                num_checked = num_refuted = num_unsupported = 0
                for line in reader:
                    line = ujson.loads(line)
                    states = line['states']
                    if is_checked(states):
                        num_checked += 1
                    elif is_refuted(states):
                        num_refuted += 1
                    else:
                        num_unsupported += 1
                print(f'VeriEQL,{workload},{num_unsupported},{num_checked},{num_refuted}', file=writer)
        for (tool, workload), (num_unsupported, num_checked, num_refuted) in baselines.items():
            # print(f'{tool},{workload},{num_unsupported},{num_checked},{num_refuted}', file=writer)
            line = ','.join([tool, workload, str(num_unsupported), str(num_checked), str(num_refuted)])
            print(line, file=writer)


def count_coverage_no_IC(args):
    heads = ["tool", "workload", "unsupported", "checked", "not checked"]
    baselines = {
        ("Cosette", "LeetCode"): [23821, 173, 0],
        ("Cosette", "Calcite"): [362, 34, 1],
        ("Cosette", "Literature"): [2, 23, 39],
        ("Qex", "LeetCode"): [23821, 173, 0],
        ("Qex", "Calcite"): [362, 34, 1],
        ("Qex", "Literature"): [2, 29, 33],
        ("SPES", "LeetCode"): [9960, 1372, 12662],
        ("SPES", "Calcite"): [79, 108, 210],
        ("SPES", "Literature"): [28, 8, 28],
        ("HoTTSQL", "LeetCode"): [23822, 172, 0],
        ("HoTTSQL", "Calcite"): [367, 30, 0],
        ("HoTTSQL", "Literature"): [43, 21, 0],
        ("DataFiller", "LeetCode"): [0, 14926, 9068],
        ("DataFiller", "Calcite"): [0, 372, 25],
        ("DataFiller", "Literature"): [0, 40, 24],
        ("XData", "LeetCode"): [16332, 5623, 0],
        ("XData", "Calcite"): [215, 171, 11],
        ("XData", "Literature"): [26, 37, 1],
    }

    with open(args.output_file, 'w') as writer:
        print(','.join(heads), file=writer)
        for filename in args.filenames:
            with open(filename, 'r') as reader:
                workload = get_workload(filename)
                num_checked = num_refuted = num_unsupported = 0
                for line in reader:
                    line = ujson.loads(line)
                    states = line['states']
                    if is_checked(states):
                        num_checked += 1
                    elif is_refuted(states):
                        num_refuted += 1
                    else:
                        num_unsupported += 1
                print(f'VeriEQL,{workload},{num_unsupported},{num_checked},{num_refuted}', file=writer)
        for (tool, workload), (num_unsupported, num_checked, num_refuted) in baselines.items():
            line = ','.join([tool, workload, str(num_unsupported), str(num_checked), str(num_refuted)])
            print(line, file=writer)

        with open(args.aux_filename, 'r') as reader:
            next(reader)
            for line in reader:
                tool, workload, num_unsupported, num_checked, num_refuted = line.strip().split(',')
                if tool in {'VeriEQL', 'DataFiller', 'XData'}:
                    tool = f'{tool}-RQ1'
                    line = ','.join([tool, workload, str(num_unsupported), str(num_checked), str(num_refuted)])
                    print(line, file=writer)


def count_dist(args):
    workloads = ["LeetCode", "Calcite", "Literature"]
    heads = ["bound"] + workloads
    bounds = [str(i) for i in range(1, 11)] + \
             ['11-15', '16-20', '21-30', '31-40', '41-50', '51-60', '61-70', '71-80', '81-90', '91-100', '>100']

    indices = list(range(1, 11)) + [15, 20, 30, 40, 50, 60, 70, 80, 90, 100]

    def get_idx(v):
        for idx, index in enumerate(indices):
            if v <= index:
                return idx
        return len(indices)

    with open(args.output_file, 'w') as writer:
        print(','.join(heads), file=writer)

        results = {}
        for filename in args.filenames:
            workload = get_workload(filename)
            workload_results = {bound: 0 for bound in bounds}
            with open(filename, 'r') as reader:
                for line in reader:
                    line = ujson.loads(line)
                    states = line['states']
                    if is_checked(states):
                        bound_size = sum(1 for s in states if s == STATE.EQUIV)
                        # for idx in range(get_idx(bound_size)):
                        #     bs = bounds[idx]
                        workload_results[bounds[get_idx(bound_size)]] += 1
            results[workload] = workload_results
        for bound in bounds:
            line = ','.join([bound] + [str(results[workload][bound]) for workload in workloads])
            print(line, file=writer)


def main(args):
    if args.task == 'coverage':
        count_coverage(args)
    elif args.task == 'coverage_no_ic':
        count_coverage_no_IC(args)
    elif args.task == 'distribution':
        count_dist(args)
    else:
        raise NotImplementedError(f'{args.task} is NOT in {__TASK}')


if __name__ == "__main__":
    main(args)
