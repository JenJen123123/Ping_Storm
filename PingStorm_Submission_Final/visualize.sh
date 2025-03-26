#!/bin/bash

file="DataLog.txt"

if [[ ! -f "$file" ]]; then
  echo "No DataLog.txt found. Please run the ping test first."
  exit 1
fi

echo ""
echo "PINGSTORM VISUALIZATION"
echo "----------------------------"

fastest=""
slowest=""
min_latency=999999
max_latency=0
total_latency=0
count=0

# Collect and display data
while IFS=',' read -r domain latency_raw; do
  latency=$(echo "$latency_raw" | grep -o '[0-9.]*')
  bar_len=$(awk "BEGIN {printf "%d", $latency / 2}")
  bar=$(printf "%${bar_len}s" | tr ' ' '█')

  echo "$domain | $bar ${latency}ms"

  if (( $(echo "$latency < $min_latency" | bc -l) )); then
    min_latency=$latency
    fastest=$domain
  fi
  if (( $(echo "$latency > $max_latency" | bc -l) )); then
    max_latency=$latency
    slowest=$domain
  fi

  total_latency=$(echo "$total_latency + $latency" | bc)
  count=$((count + 1))
done < "$file"

avg=$(echo "scale=2; $total_latency / $count" | bc)

echo ""
echo "Fastest: $fastest (${min_latency}ms)"
echo "Slowest: $slowest (${max_latency}ms)"
echo "Average Latency: ${avg}ms"
