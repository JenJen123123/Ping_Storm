#! /bin/bash

echo " " >>pingstorm.log
echo "----------------------------------------------" >>pingstorm.log
echo "~~~~~~~~~~~ Analysis of Results ~~~~~~~~~~~~~~" >>pingstorm.log
echo "~~~~~~~~~~~ $(date '+%Y %m %d %H:%M:%S') ~~~~~~~~~~~~~~" >>pingstorm.log
echo "----------------------------------------------" >>pingstorm.log
echo " " >>pingstorm.log

echo "  "
echo -e "\e[1;31;41m   Website     Min      Max  \e[0m"
echo "-----------------------------"

echo "   Website     Min      Max  " >>pingstorm.log
echo "-----------------------------" >>pingstorm.log
awk 'NR>0{printf "%-13s %-8s %-8s\n", $1, $2, $4}' DataLog.txt  | sort -k2 -nr >>pingstorm.log
: '
while read -r line; do
    function sorting {
        #echo 'Web Site -- Avg speed'
        #echo '---------------------------'
        awk 'NR>0{printf "%-13s %-8s %-8s\n", $1, $2, $4}' DataLog.txt  | sort -k2 -nr | tee -a pingstorm.log
    }
    #echo "---------------------------"
done <DataLog.txt
'

function sorting {
        #echo 'Web Site -- Avg speed'
        #echo '---------------------------'
        awk 'NR>0{printf "%-13s %-8s %-8s\n", $1, $2, $4}' DataLog.txt  | sort -k2 -nr
    }

sorting

sorting | grep -v "N/A" | awk '{print $1 " " $2}' >noErrorLog.txt

printf "\n\e[1;33;43m     Summary of the results     \e[0m\n"
echo "--------------------------------"

echo " " >>pingstorm.log
echo "     Summary of the results     " >>pingstorm.log
echo "--------------------------------" >>pingstorm.log
echo "Fastest: " >>pingstorm.log
fastest=$(tail -n 1 noErrorLog.txt)
echo "Fastest: $fastest" >> pingstorm.log
printf "\e[1;32mFastest: %-13s %-1s ms\e[0m\n" $(awk '{print $1, $2}' <<< "$fastest") | tee -a pingstorm.log

slowest=$(head -n 1 noErrorLog.txt)
echo "Slowest: $slowest" >> pingstorm.log
printf "\e[1;31mSlowest: %-13s %-1s ms\e[0m\n" $(awk '{print $1, $2}' <<< "$slowest") | tee -a pingstorm.log


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
echo "Average: $average" >>pingstorm.log

echo " "
