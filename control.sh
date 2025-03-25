#!/bin/bash

options=("Start" "Stop" "Status" "Show" "Quit")

select comd in "${options[@]}"; do
	case $comd in
		"Start")
			echo "    "
			echo "    "
			echo -e "\e[1;33;40m ~~~ Starting Ping Storm ~~~ \e[0m"
			echo "    "
			echo "    "
			./ping.sh
			;;
		"Stop")
			echo "Stoping..."
			;;
		"Status")
			echo "Status..."
			;;
		"Show")
			echo "show..."
			;;
		"Quit")
			echo "Exiting..."
			break
			;;
		*) echo "Invalid option";;
	esac
done
