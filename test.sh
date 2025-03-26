#!/bin/bash

# Print all test.txt words
packet_loss=0
flag=0

for read in $(cat test.txt); do
    echo $read

    if [[ $flag -eq 1 ]]; then
        packet_loss=$read
        break
    fi

    if [[ $read == "received," ]]; then
        flag=1
    fi
done

packet_loss=$(echo $packet_loss | cut -d'%' -f1)

if [[ $packet_loss -gt 50 ]]; then
    echo -e "\e[1;31;41mPacket loss is high: $packet_loss%\e[0m"
else
    echo -e "\e[1;32;42mPacket loss is acceptable: $packet_loss%\e[0m"
fi
echo "----------------------------------------------"
echo "Packet loss: $packet_loss"
