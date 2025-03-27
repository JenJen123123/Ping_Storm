#!/bin/bash

echo ""
echo "PINGSTORM VISUALIZATION"
echo "----------------------------"

data_file="DataLog.txt"

if [ ! -f "$data_file" ]; then
  echo "Error: $data_file not found."
  exit 1
fi

fastest_time=999999
slowest_time=0
total_time=0
count=0

while IFS=',' read -r site min max avg stddev; do
  # Clean avg value
  avg_clean=$(echo "$avg" | tr -d 'ms ')

  if [[ -z $avg_clean || ! $avg_clean =~ ^[0-9]+$ ]]; then
    echo "$site | N/A"
    continue
  fi

  bar_len=$((avg_clean / 2))
  bar=$(printf "%-${bar_len}s" | tr ' ' '█')

  echo "$site | $bar ${avg_clean}ms"

  # Fastest/slowest check
  if [ "$avg_clean" -lt "$fastest_time" ]; then
    fastest_time=$avg_clean
    fastest_site=$site
  fi

  if [ "$avg_clean" -gt "$slowest_time" ]; then
    slowest_time=$avg_clean
    slowest_site=$site
  fi

  total_time=$((total_time + avg_clean))
  ((count++))

done < "$data_file"

if [ $count -gt 0 ]; then
  avg_all=$((total_time / count))
  echo ""
  echo " Fastest: $fastest_site (${fastest_time}ms)"
  echo " Slowest: $slowest_site (${slowest_time}ms)"
  echo " Average Latency: ${avg_all}ms"
else
  echo "No valid data found."
fi
