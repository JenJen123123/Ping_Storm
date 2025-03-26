#! /bin/bash

echo " "
echo -e "\e[1;31;41m   Website     Min      Max  \e[0m"
echo "-----------------------------"

while read -r line; do
    function sorting {
        #echo 'Web Site -- Avg speed'
        #echo '---------------------------'
        awk 'NR>0{printf "%-13s %-8s %-8s\n", $1, $2, $4}' DataLogCopy.txt | sort -k2 -nr
    }
    #echo "---------------------------"
done <DataLogCopy.txt

sorting

sorting | grep -v "N/A" | awk '{print $1 " " $2}' >noErrorLog.txt

printf "\n\e[1;31;41m     Summary of the results     \e[0m\n"
echo "--------------------------------"

fastest=$(cat noErrorLog.txt | tail -n 1)
printf "\e[1;32mFastest: %-13s %-1s ms\e[0m\n" $(echo $fastest | awk '{print $1, $2}')
slowest=$(cat noErrorLog.txt | head -n 1)
printf "\e[1;31mSlowest: %-13s %-1s ms\e[0m\n" $(echo $slowest | awk '{print $1, $2}')

#Calulating average latency
mapfile -t numbers < <(sorting | awk '{print $3}')
sum=0
count=0

for num in "${numbers[@]}"; do
    sum=$(echo "$sum + $num" | bc)
    ((count++))
done

average=$(echo "scale=3; $sum / $count" | bc)
echo -e "\e[1;33mAverage: $average\e[0m"

echo " "
