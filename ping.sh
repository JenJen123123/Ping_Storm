#!/bin/bash

# Script to ping a list of websites and display the results in a formatted table

# Function to handle errors
error() {
    echo "$(date '+%Y %m %d %H:%M:%S')" "$site" "Didn't send any answer" >>Error.log
}

# List of services to ping
# You can add or remove services from this list
# The script will ping each service and display the results
services=(
    "google.com"
    "facebook.com"
    "tiktok.com"
    "youtube.com"
    "netflix.com"
)

#Addin the number of services to the log
num_services=${#services[@]}

# Number of pings to send
num_pings=1 # Change this to the number of pings you want to send

# Print header
echo " "
echo -e "\e[1;32mSending $num_pings ping(s) to each website and summarizing the results\e[0m"
echo " "
echo -e "\e[1;33mPlease wait...\e[0m"
echo " "
echo -e "\e[1;31;41mWebsite       Min      Avg      Max      Mdev \e[0m"
echo "----------------------------------------------"
#echo "Website       Min      Avg      Max      Mdev" >>DataLog.txt
#echo "----------------------------------------------" >>DataLog.txt

# echoing Date and Time to pingstorm.log
echo " " >>pingstorm.log
echo "----------------------------------------------" >>pingstorm.log
echo "~~~~~~~~~~ Ping Test with $num_pings ping(s) ~~~~~~~~~~" >>pingstorm.log
echo "~~~~~~~~~~~~~ Pinging $num_services services ~~~~~~~~~~~~~" >>pingstorm.log
echo "~~~~~~~~~~~ $(date '+%Y %m %d %H:%M:%S') ~~~~~~~~~~~~~~" >>pingstorm.log
echo "----------------------------------------------" >>pingstorm.log

# Loop services
for site in "${services[@]}"; do
    echo " " >>pingstorm.log
    echo "***" >>pingstorm.log
    #ping_result=$(ping -c $num_pings $site 2>/dev/null | grep "^rtt min")
    ping_result=$(ping -c $num_pings $site 2>&1 | tee -a pingstorm.log | grep "^rtt min")
    #We need to add a packet loss condition
    if [ ! -z "$ping_result" ]; then
        # format output
        good_result=$(echo "$ping_result" | awk -v site="$site" -F'= ' '{
            # Split the values (min/avg/max/mdev)
            split($2, a, "/"); 
            
            # Remove " ms" from the last value
            gsub(/ ms/, "", a[4]); 
            
            # Format output with fixed width columns
            printf "%-13s %-8s %-8s %-8s %-8s\n", site, a[1], a[2], a[3], a[4]
        }')

        echo "$good_result"
        echo "$good_result" >>DataLog.txt
    else
        printf "\e[1;31m%-13s %-8s %-8s %-8s %-8s\e[0m\n" "$site" "N/A" "N/A" "N/A" "N/A"
        printf "%-13s %-8s %-8s %-8s %-8s\n" "$site" "N/A" "N/A" "N/A" "N/A" >>DataLog.txt
        # If error, print error message with date and site name to Error.log
        error
    fi

done

echo -e "\n\e[1;31;44m~~~~~~~ Ping Script Execution Complete ~~~~~~~\e[0m"
echo " "
