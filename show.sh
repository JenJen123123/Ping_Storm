#!/bin/bash
echo " "
echo -e "\e[1;36m~~~ 🌐 PINGSTORM REPORT ~~~\e[0m"  # Changed to cyan with a globe icon

header=$(grep "Pinging" ./pingstorm.log | tail -n 1 | sed 's/--//g')
echo -e "\e[1;36m📋 $header\e[0m"  # Cyan with clipboard icon
echo " "

header1=$(grep -A 3 "Summary" ./pingstorm.log | tail -n 4)
echo " "
echo -e "\e[1;32m✅ $header1\e[0m"  # Green with checkmark icon
echo " "
echo -e "\e[1;31m🐢 $(grep -A 1 'Slowest' ./pingstorm.log | tail -n 2)\e[0m"  # Red with turtle icon
echo " "
echo -e "\e[1;33m⚡ $(grep 'Average' ./pingstorm.log | tail -n 1)\e[0m"  # Yellow with lightning icon
echo " "