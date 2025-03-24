#!/bin/bash

# Ping script to check the availability of target services

# List of target services
services=(
    "google.com"
    "facebook.com"
    "tiktok.com"
    "youtube.com"
    #"netflix.com"
)

# Loop through each service and ping
for service in "${services[@]}"; do
    #echo "Pinging ${service}..."
    echo -e "\e[1;31m ~~~ Pinging \e[36m${service}\e[0m ~~~ \e[0m"
    ping -c 1 "$service"
    echo "-----------------------------------"
done

# End of script

echo " "
#echo -e "\e[1;31m ~~~ End of script ~~~ \e[0m"
echo -e "\e[1;33;40m ~~~ End of script ~~~ \e[0m"
echo " "
