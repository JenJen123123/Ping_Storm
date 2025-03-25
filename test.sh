#!/bin/bash

options=("Start" "Stop" "Status" "Show" "Quit")
PING_PID=0

select comd in "${options[@]}"; do
        case $comd in
                "Start")
                        echo "    "
                        echo -e "\e[1;33;40m ~~~ Starting Ping Storm ~~~ \e[0m"
                        echo "    "
			# Check if already running
                        if [ $PING_PID -ne 0 ] && ps -p $PING_PID > /dev/null; then
				echo "Ping Storm is already running (PID: $PING_PID)"
                        else
				./ping.sh > pingstorm.txt 2>&1 &
				PING_PID=$!
				echo "Ping Storm started in background (PID: $PING_PID)"
                                echo "Output is being saved to pingstorm.txt"
			fi
                        ;;
                "Stop")
                        echo "    "
                        if [ $PING_PID -ne 0 ] && ps -p $PING_PID > /dev/null; then
				kill $PING_PID
                                echo "Stopped Ping Storm (PID: $PING_PID)"
                                PING_PID=0
                        else
				echo "No active Ping Storm process found"
                        fi
                        ;;
                "Status")
                        echo "    "
                        echo "Status..."
                        ;;
                "Show")
                        echo "    "
                        echo "show..."
                        ;;
                "Quit")
                        echo "    "
                        echo "Exiting..."
                        break
                        ;;
                *) echo "Invalid option";;
        esac
done
