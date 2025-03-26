#!/bin/bash

options=("Start" "Stop" "Status" "Show" "Quit")
PING_PID=0

select comd in "${options[@]}"; do
	case $comd in
		"Start")
			echo "    "
			echo -e "\e[1;33;40m ~~~ Starting Ping Storm ~~~ \e[0m"
			echo "    "
			if [[ $PING_PID -ne 0 ]] && ps -p $PING_PID > /dev/null; then
				echo "PingStorm is already running (PID: $PING_STORM)"
			else
				./ping.sh > pingstorm.log 2>&1 &
				PING_PID=$!
				echo "PingStorm started in background (PID : $PING_PID)"
				echo "Output is beingsaved to pingstorm.log"
			fi
			;;
		"Stop")
			##continue stop option##
			echo "    "
			echo "Stoping..."
			if [[ $PING_PID -ne "0" ]]; then

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

