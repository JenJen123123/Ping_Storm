#!/bin/bash

# This is a simple script to display the running processes of ping.sh

for ((i = 0; i < 1000; i++)); do
    color=$((31 + (i % 7))) # Cycle through colors 31 to 37
    echo -e "\033[1;${color}mIteration: $i\033[0m"
    #echo -e "\033[1;34mRunning Processes:\033[0m"
    ps -aux | grep "ping.sh"
    ps -aux | grep "ping -c"
    echo ""
    sleep 1
done
