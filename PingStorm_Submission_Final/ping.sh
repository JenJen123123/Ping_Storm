#!/bin/bash

# Detect platform
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  ping_cmd="ping -n 3"
else
  ping_cmd="ping -c 3"
fi

# Output log file
LOG_FILE="pingstorm.txt"

# List of services
services=(
    "google.com"
    "facebook.com"
    "tiktok.com"
    "youtube.com"
)

# Clear old log
> "$LOG_FILE"

# Run ping for each service
for service in "${services[@]}"; do
    echo -e "\e[1;31m~~~ Pinging \e[36m${service}\e[0m ~~~" | tee -a "$LOG_FILE"
    $ping_cmd "$service" | tee -a "$LOG_FILE"
    echo "-----------------------------------" | tee -a "$LOG_FILE"
done

# End of ping section
echo -e "\n\e[1;33m~~~ End of ping test ~~~\e[0m\n"

# Simple Menu Display (functionality can be added later)
echo "1) Start"
echo "2) Stop"
echo "3) Status"
echo "4) Show"
echo "5) Quit"
