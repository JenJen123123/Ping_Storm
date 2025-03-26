#! /bin/bash

echo " "
echo -e "\e[1;31;41m   Website     Min      Max  \e[0m"
echo "---------------------------"

while read -r line; do
    function sorting {
        #echo 'Web Site -- Avg speed'
        #echo '---------------------------'
        awk 'NR>0{printf "%-13s %-8s %-8s\n", $1, $2, $4}' DataLogCopy.txt | sort -k2 -nr
    }
    #echo "---------------------------"
done <DataLogCopy.txt

sorting

sorting | grep -v "N/A" >noErrorLog.txt

printf "\n~~~ Sorting 1 ~~~\n\n"
fastest=$(sorting | tail -n 1)
echo "Fastest: $fastest ms"
slowest=$(sorting | head -n 1)
echo "Slowest: $slowest ms"

printf "\n~~~ Sorting 2 ~~~\n\n"
fastest=$(cat noErrorLog.txt | tail -n 1)
echo "Fastest: $fastest ms"
slowest=$(cat noErrorLog.txt | head -n 1)
echo "Slowest: $slowest ms"

#Calulating average latency
mapfile -t numbers < <(sorting | awk '{print $3}')
sum=0
count=0

for num in "${numbers[@]}"; do
    sum=$(echo "$sum + $num" | bc)
    ((count++))
done

average=$(echo "scale=3; $sum / $count" | bc)
echo "Average: $average"
