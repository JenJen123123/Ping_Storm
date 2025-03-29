#!/bin/bash

# Clear the screen for better readability
clear

# Display the header
echo -e "\n\e[1;37;44m🌐 PINGSTORM REPORT\e[0m\n"

# Extract and display the last "Pinging" line as the main header
header=$(grep "Pinging" ./pingstorm.log | tail -n 1 | sed 's/[~\-]//g')
echo -e "\e[1;36m📋$header\e[0m\n"

# Extract and display the summary section
summary=$(grep -A 1 "Fastest" ./pingstorm.log | tail -n 2 | sed 's/[~\-]//g')
echo -e "\e[1;32m🚀 $summary\e[0m\n"

# Extract and display the slowest ping information
slowest=$(grep -A 1 'Slowest' ./pingstorm.log | tail -n 2 | sed 's/[~\-]//g')
echo -e "\e[1;31m🐢 $slowest\e[0m\n"

# Extract and display the average ping information
average=$(grep 'Average' ./pingstorm.log | tail -n 1 | sed 's/[~\-]//g')
echo -e "\e[1;33m📊 $average\e[0m\n"

# Display menu options
echo -e "\e[1;44;37m📋 Menu Options:\e[0m"
echo -e "\n1) Start"
echo "2) Stop"
echo "3) Status"
echo "4) Show"
echo "5) Quit"