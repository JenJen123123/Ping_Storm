#!/bin/bash

# List of target services
services=(
    "google.com"
    "facebook.com"
    "tiktok.com"
    "youtube.com"
    "netflix.com"
)

# Loop through each service and ping
for service in "${services[@]}"; do
    echo "Pinging ${service}..."
    ping -c 4 "$service"
    echo "-----------------------------------"
done
