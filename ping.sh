#!/bin/bash

#Output file
LOG_FILE="pingstorm.txt"

# Ping script to check the availability of target services

# List of target services
services=(
    "google.com"
    "facebook.com"
    "tiktok.com"
    "youtube.com"
    #"netflix.com"
)

#Clear log file
> "$LOG_FILE"

# Loop through each service and ping
for service in "${services[@]}"; do
    #echo "Pinging ${service}..."
    echo -e "\e[1;31m ~~~ Pinging \e[36m${service}\e[0m ~~~ \e[0m" | tee -a "$LOG_FILE"
    ping -c 3 "$service" | tee -a "$LOG_FILE"
    echo "-----------------------------------" | tee -a "$LOG_FILE"
done

# End of script

echo " "
#echo -e "\e[1;31m ~~~ End of script ~~~ \e[0m"
echo -e "\e[1;33;40m ~~~ End of script ~~~ \e[0m"
echo " "
echo " "
echo "1) Start"
echo "2) Stop"
echo "3) Status"
echo "4) Show"
echo "5) Quit"
