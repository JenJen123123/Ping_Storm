#!/bin/bash

echo " "
echo -e "\e[1;31m 🐧 PINGSTORM REPORT\e[0m"
echo " "

# Function to show a progress bar
progress_bar() {
    total=$1
    current=0
    bar=""
    while [ $current -lt $total ]; do
        let current++
        # Build progress bar string
        bar=$(printf "%-${total}s" "#" | sed "s/ /#/g")
        printf "\r[%-${total}s] %d%%" "$bar" $((current * 100 / total))
        sleep 0.1  # Simulate progress (adjust this for actual task)
    done
    echo
}

header=$(grep "Num of services" ./pingstorm.log | tail -n 1 | sed 's/--//g')

# Start progress for Num of services
progress_bar 50
echo -e "\e[1;34m$header\e[0m"

# Start progress for Summary
header1=$(grep -A 3 "Summary" ./pingstorm.log | tail -n 4)
progress_bar 30
echo -e "\e[1;34m$header1\e[0m"

# Start progress for Slowest
progress_bar 25
echo -e "\e[1;34m$(grep -A 1 'Slowest' ./pingstorm.log | tail -n 2)\e[0m"

# Start progress for Average
progress_bar 20
echo -e "\e[1;34m$(grep 'Average' ./pingstorm.log | tail -n 1)\e[0m"
