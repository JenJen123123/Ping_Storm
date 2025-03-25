#!/bin/bash

options=("Start" "Stop" "Status" "Show" "Quit")

select comd in "${options[@]}"; do
	case $comd in
		"Start")
			echo "    "
			echo -e "\e[1;33;40m ~~~ Starting Ping Storm ~~~ \e[0m"
			echo "    "
			`./ping.sh`
			;;
		"Stop")
			echo "    "
			echo "Stoping..."
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

