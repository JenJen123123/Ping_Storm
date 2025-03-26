#! /bin/bash
#! /bin/bash


while read -r line;do
function sorting  {
#echo 'Web Site -- Avg speed'
#echo '---------------------------'
awk 'NR>0{print $1, $2, $3}' ping_results.csv | sort -k2 -nr
}
#echo "---------------------------" 
done <ping_results.csv
sorting
fastest=$(sorting | tail -n 1)
echo "Fastest: $fastest ms"
slowest=$(sorting | head -n 1)
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
