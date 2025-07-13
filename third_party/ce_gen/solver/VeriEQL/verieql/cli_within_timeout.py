# -*- coding: utf-8 -*-

import argparse
import time
from multiprocessing import (
    Process,
    Queue,
    cpu_count,
    Manager,
)

import tqdm
import ujson

from constants import *
from environment import Environment
from errors import *
from logger import LOGGER
from utils import (
    divide,
)

# parser = argparse.ArgumentParser(description='VeriEQL cli within timeout.')
# parser.add_argument('-f', '--filename', type=str, required=True,
#                     help="The input filename of benchmarks (in the format of *.jsonlines).")
# parser.add_argument('-t', '--timeout', type=int, default=TIMEOUT, help="The timeout (10 min by default).")
# # multiprocessing might decrease the CPU's performance on each core, but it decreases the total time cost
# parser.add_argument('-n', '--num_cores', type=int, default=1, choices=list(range(1, 1 + cpu_count())),
#                     help=f"The number of multiprocessing (1~{cpu_count()}).")
# parser.add_argument('-i', '--integrity_constraint', default=1, choices=[0, 1], type=int,
#                     help="The flag of considering integrity constraints (1 for yes and 0 for no).")
# parser.add_argument('-o', '--output_file', type=str, required=True, help="The output filename of experimental results.")
# args = parser.parse_args()

__MAX_BOUND_SIZE = 9999999999


def verify(schema, constraint, query1, query2, bound_size, queue: Queue):
    err_info = None
    with Environment(timer=True, generate_code=True) as env:
        for name, db in schema.items():
            env.create_database(db, bound_size=bound_size, name=name)
        if True and constraint is not None:
            env.add_constraints(constraint)
        env.save_checkpoints()
        env.reload_checkpoints()
        try:
            result = env.analyze(query1, query2)
            if result == False:
                raise NotEquivalenceError()
            else:
                state = STATE.EQUIV
        except SyntaxError as err:
            err_info = str(err)
            state = STATE.SYN_ERR
        except NotEquivalenceError as err:
            err_info = str(err)
            state = STATE.NON_EQUIV
        except TimeoutError as err:
            err_info = str(err)
            state = STATE.TIMEOUT
        except NotSupportedError as err:
            err_info = str(err)
            state = STATE.NOT_SUP_ERR
        except UnknownError as err:
            err_info = str(err)
            state = STATE.UNKNOWN
        except NotImplementedError as err:
            err_info = str(err)
            state = STATE.NOT_IMPL_ERR
        except Exception as err:
            err_info = str(err)
            state = STATE.OTHER_ERR
        counterexample = env.sql_code if isinstance(env.sql_code, str) else None
        if env.solving_time is None:
            outs = [state, round(time.time() - env.traversing_time, 6), None, counterexample, err_info]
        else:
            outs = [state, env.traversing_time, env.solving_time, counterexample, err_info]
        for o in outs:
            queue.put(o)


def process_ends_with_max_timeout(
        index, schema, constraint, query1, query2, max_bound_size, states, time_cost,
        timeout, queue: Queue
):
    result = {
        'index': index,
        'pair': [query1, query2],
        'states': [],
        'times': [],
        'counterexample': None,
        'err': None,
    }
    if states is not None and time_cost is not None:
        result['states'] = states
        result['times'] = time_cost

    pbar = tqdm.tqdm(total=max_bound_size, desc=f'Bound size: {0:5d} | Thread: {1:3d}', )

    bound_size = 1
    pbar.set_description(f'Bound size: {bound_size:5d} | Thread: {1:3d}', refresh=False)
    pbar.update(bound_size)
    queue.empty()
    proc = Process(
        target=verify,
        args=(schema, constraint, query1, query2, bound_size, queue,),
    )
    proc.start()

    start = time.time()
    while time.time() - start <= timeout and bound_size <= max_bound_size:
        if not proc.is_alive():
            # All the processes are done, break now.
            try:
                state, traversing_time, solving_time, counterexample, err = [queue.get() for _ in range(queue.qsize())]
                result['states'].append(state)
                result['times'].append([traversing_time, solving_time])
                result['counterexample'] = counterexample
                result['err'] = err
            except ValueError:
                # out of memory
                state = STATE.OOM
                result['states'].append(state)
                result['times'].append(None)

            if state == STATE.EQUIV:
                # only continute if queries are = or !=
                bound_size += 1
                pbar.set_description(f'Bound size: {bound_size:5d} | Thread: {1:3d}', refresh=False)
                pbar.update(bound_size)
                queue.empty()
                proc = Process(
                    target=verify,
                    args=(schema, constraint, query1, query2, bound_size, queue,),
                )
                proc.start()
            else:
                # not support
                break
        else:
            time.sleep(0.1)  # Just to avoid hogging the CPU
    else:
        # We only enter this if we didn't 'break' above.
        LOGGER.debug("timed out, killing all processes")
        proc.terminate()
        proc.join()
        result['states'].append(STATE.TIMEOUT)
        result['times'].append(None)
    return result


def core(pbar, output_file, desc, timeout, worker_idx):
    pbar = tqdm.tqdm(pbar, desc=desc, mininterval=10)

    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    with open(output_file, 'w') as writer:
        for parameters in pbar:
            file_path = parameters.pop(-1)
            manager = Manager()
            queue = manager.Queue()
            out = process_ends_with_max_timeout(*parameters, timeout, queue)
            # to log for check
            out['file'] = file_path
            out['schema'] = parameters[1]
            out['constraint'] = parameters[2]
            print(ujson.dumps(out, ensure_ascii=False), file=writer)


# def main(args):
#     with open(args.filename, 'r') as reader:
#         parameters = []
#         for file in reader:
#             context = ujson.loads(file)
#             index = context['index']
#             schema = context['schema']
#             pair = context['pair']
#             if context.get('contain_unsupported_constraints', False):
#                 constraint = None
#             else:
#                 constraint = context.get('constraint', None)
#             if 'file' in context:
#                 file_path = context['file']
#             elif 'name' in context:
#                 file_path = context['name']
#             elif 'benchmark' in context:
#                 file_path = context['benchmark']
#             states = timecost = None
#             parameters.append([index, schema, constraint, *pair, __MAX_BOUND_SIZE, states, timecost, file_path])
#         # output_file = args.filename[:args.filename.rfind('.jsonlines')] + '.out'
#         # if os.path.exists(output_file):
#         #     with open(output_file, 'r') as reader:
#         #         for idx, line in enumerate(reader):
#         #             line = ujson.loads(line)
#         #             parameters[idx][-2] = line['states']
#         #             parameters[idx][-1] = line['times']
#         count = len(parameters)

#         if args.num_cores == 1:
#             core(
#                 parameters,
#                 args.output_file,
#                 f'Bound size: {__MAX_BOUND_SIZE:3d} | Thread: {1:3d}',
#                 args.timeout,
#                 worker_idx=1,
#             )
#         else:
#             parameters = list(divide(parameters, partitions=args.num_cores))
#             procs = []
#             for worker_idx in range(len(parameters)):
#                 proc = Process(
#                     target=core,
#                     args=(
#                         parameters[worker_idx],
#                         args.output_file + str(worker_idx),
#                         f'Bound size: {__MAX_BOUND_SIZE:3d} | Thread: {worker_idx:3d}',
#                         args.timeout,
#                         worker_idx,
#                     ),
#                 )
#                 proc.start()
#                 procs.append(proc)

#             for proc in procs:
#                 proc.join()

#             with open(args.output_file, 'w') as writer:
#                 results = []
#                 for worker_idx in range(len(parameters)):
#                     file = args.output_file + str(worker_idx)
#                     with open(file, 'r') as reader:
#                         for line in reader:
#                             line = ujson.loads(line)
#                             results.append(line)
#                     os.remove(file)
#                 assert len(results) == count, (args.filename, len(results), count)
#                 for line in results:
#                     print(ujson.dumps(line), file=writer)


# if __name__ == '__main__':
#     main(args)
