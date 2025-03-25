#!/bin/bash

options=("Start" "Stop" "Status" "Show" "Quit")

select comd in "${options[@]}"; do
	case $comd in
		"Start")
			echo "Starting..."
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
