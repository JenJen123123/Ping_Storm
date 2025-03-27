#!/bin/bash

echo " "
echo -e "\e[1;31m 🐧 PINGSTORM REPORT\e[0m"
echo " "

# Function to show a progress bar based on latency
progress_bar_latency() {
    latency=$1
    max_latency=$2
    total_width=$3

    # Calculate the number of "#" based on latency
    bar_width=$((latency * total_width / max_latency))

    # Create the progress bar
    bar=$(printf "%-${bar_width}s" "#" | sed "s/ /#/g")
    spaces=$(printf "%-$((total_width - bar_width))s")

    # Print the progress bar
    printf "\r[%-${total_width}s] %dms" "$bar$spaces" "$latency"
}

header=$(grep "Num of services" ./pingstorm.log | tail -n 1 | sed 's/--//g')

# Start progress for Num of services
progress_bar_latency 200 500 50
echo -e "\e[1;34m$header\e[0m"

# Start progress for Summary
header1=$(grep -A 3 "Summary" ./pingstorm.log | tail -n 4)
progress_bar_latency 120 500 50
echo -e "\e[1;34m$header1\e[0m"

# Start progress for Slowest
latency_slowest=$(grep -A 1 'Slowest' ./pingstorm.log | tail -n 2 | awk '{print $NF}' | sed 's/ms//')
progress_bar_latency ${latency_slowest%.*} 500 50
echo -e "\e[1;34m$(grep -A 1 'Slowest' ./pingstorm.log | tail -n 2)\e[0m"

# Start progress for Average
latency_avg=$(grep 'Average' ./pingstorm.log | tail -n 1 | awk '{print $NF}' | sed 's/ms//')
progress_bar_latency ${latency_avg%.*} 500 50
echo -e "\e[1;34m$(grep 'Average' ./pingstorm.log | tail -n 1)\e[0m"

# Example of ping latency comparison, assuming we're checking a server's latency
ping_target="google.com"
echo -e "\e[1;34mPing Latency Report:\e[0m"

# Test 5 pings and show progress bars for latency
for i in {1..5}; do
    # Get the latency of the ping (in milliseconds)
    latency=$(ping -c 1 $ping_target | grep 'time=' | sed -E 's/.*time=([0-9.]+) ms/\1/')
    
    # If latency is not empty, convert it to integer and show the progress bar
    if [[ -n "$latency" ]]; then
        # Set the maximum latency for the progress bar (e.g., 500ms)
        max_latency=500
        # Set the total width of the bar (e.g., 50 characters)
        progress_bar_latency ${latency%.*} $max_latency 50
        sleep 1  # Simulate time between pings (adjust as needed)
    else
        echo -e "\rPing failed"
    fi
done

echo
