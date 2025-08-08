#!/bin/bash

benchmark=$1
dataset_type=${2:-train}  # Use second parameter if provided, otherwise default to 'train'

if [[ "$benchmark" != "spider" && "$benchmark" != "bird" ]]; then
    echo "Not supported benchmark. Please specify 'spider' or 'bird' benchmark."
    exit 1
fi

# Script to monitor dataset_refine.py processes
# This script checks if any of the 8 processes started by dataset_refine.sh have shut down
echo "====== Dataset Refine Process Monitor ======"

expected_processes=8

missing_partitions=()
running_partitions=()

for i in $(seq 0 $((${expected_processes}-1))); do
    if ps aux | grep "dataset_refine.py" | grep -v grep | grep -- "--benchmark ${benchmark}" | grep -- "--dataset_type ${dataset_type}" | grep -q "partition_id ${i}"; then        
        running_partitions+=($i)
    else
        missing_partitions+=($i)
    fi
done

running_processes=${#running_partitions[@]}
# echo "Currently running dataset_refine.py processes: $running_processes"

# Show detailed process information
echo ""
echo "=== Detailed Process Information ==="
ps aux | grep "dataset_refine.py" | grep -v grep | while read line; do
    echo "  $line"
done

echo ""
echo "=== Process Status Summary ==="
echo "Expected processes: $expected_processes"
echo "Running processes: $running_processes"
echo "Stopped processes: $((expected_processes - running_processes))"
echo "Running partition IDs: ${running_partitions[*]}"
echo "Missing partition IDs: ${missing_partitions[*]}"

# Status message
if [ $running_processes -eq $expected_processes ]; then
    echo ""
    echo "All $expected_processes processes are running normally..."
elif [ $running_processes -eq 0 ]; then
    echo ""
    echo "All processes have stopped. No dataset_refine.py processes are running."
else
    stopped_processes=$((expected_processes - running_processes))
    echo ""
    echo "$stopped_processes out of $expected_processes processes have stopped."
fi

# Output progress for each partition
echo ""
echo "=== Partition Progress ==="

partitions_to_resume=()
for i in $(seq 0 $((${expected_processes}-1))); do
    modified_gold_file="./results/dataset_refine/${benchmark}_${dataset_type}/SQLDriller/modified_gold_${i}.tsv"
    log_file="./results/dataset_refine/${benchmark}_${dataset_type}/SQLDriller/log/log_${i}"

    # Try to get total_cases for this partition from the log file
    if [ -f "$log_file" ]; then
        total_cases=$(grep -m1 "Total number of cases:" "$log_file" | awk -F':' '{print $2}' | tr -d ' ')
    else
        total_cases=""
    fi

    if [ -z "$total_cases" ]; then
        echo "Warning: Could not determine total cases for partition $i from $log_file. Skipping partition $i."
        continue
    fi

    total_cases=$((total_cases))

    if [ -f "$modified_gold_file" ]; then
        processed_cases=$(wc -l < "$modified_gold_file")
    else
        processed_cases=0
    fi

    echo "Partition $i: $processed_cases/$total_cases cases processed."
    
    # Check if $i is in missing_partitions and needs resume
    if [[ " ${missing_partitions[@]} " =~ " $i " ]]; then
        if [ "$processed_cases" -lt "$total_cases" ]; then
            partitions_to_resume+=("$i")
        fi
    fi
done

if [ ${#partitions_to_resume[@]} -gt 0 ]; then
    echo ""
    echo ">>> Some processes need to be resumed. To resume processing for missing partition(s) ${partitions_to_resume[@]}:"
    for pid in "${partitions_to_resume[@]}"; do
        echo "./click_to_run/dataset_refine.sh ${benchmark} ${dataset_type} --resume $pid"
    done
fi