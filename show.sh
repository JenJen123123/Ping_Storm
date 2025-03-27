#!/bin/bash
echo " "
echo -e "\e[1;34m~~~ 🐧 PINGSTORM REPORT ~~~\e[0m"

header=$(grep "Num of services" ./pingstorm.log | tail -n 1 | sed 's/--//g')
echo -e "\e[1;34m$header\e[0m"
echo " "
header1=$(grep -A 3 "Summary" ./pingstorm.log | tail -n 4)
echo " "
echo -e "\e[1;32m$header1\e[0m"
echo " "
echo -e "\e[1;31m$(grep -A 1 'Slowest' ./pingstorm.log | tail -n 2)\e[0m"
echo " "
echo -e "\e[1;33m$(grep 'Average' ./pingstorm.log | tail -n 1)\e[0m"
echo " "