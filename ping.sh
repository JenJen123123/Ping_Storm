#!/bin/bash
services=(
    "google.com"
    "facebook.com"
    "tiktok.com"
    "youtube.com"
    "netflix.com"
)

num_pings=4

# Print header
echo "Website       Min      Avg      Max      Mdev"
echo "----------------------------------------------"

# Loop services
for site in "${services[@]}"; do
    ping_result=$(ping -c $num_pings $site 2>/dev/null | grep "^rtt min")
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
    else
        # If error
        echo "%-13s %-8s %-8s %-8s %-8s\n" "$site" "ERROR" "ERROR" "ERROR" "ERROR" >>Error.log
    fi
    
done
exit 0