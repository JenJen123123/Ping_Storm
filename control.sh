#!/bin/bash

options=("Start" "Stop" "Status" "Show" "Quit")
#PING_PID=0

PING_PID=$(pgrep -f "ping.sh")

#echo "    "#
#echo -e "\e[1;31;40m ~~~~~~~~~~~~~~ PID: $PING_PID ~~~~~~~~~~~~~~~ \e[0m"
#echo "    "



# echo "    "
# echo -e "\e[1;31;40m ~~~ PINGSTORM CONTROL PANEL ~~~ \e[0m"
# echo "    "
# if [[ -n "$PING_PID" ]]; then
# 	i=0
# 	for PID in $PING_PID; do
# 		echo "$i. PID: $PID"
# 		i=$((i + 1))
# 	done
# else
# 	echo -e "\e[1;31;40m ~~~ No Ping Storm is running ~~~ \e[0m"
# 	echo "    "
# fi
# echo "    "




menu() {
	echo "    "
	echo "======================="
	echo "1) Start"
	echo "2) Stop"
	echo "3) Status"
	echo "4) Show"
	echo "5) Quit"
	echo "======================="
	echo -n "Choose an option [1-5]: "
}

select comd in "${options[@]}"; do
	case $comd in
	"Start")
		echo "    "
		echo -e "\e[1;33;40m ~~~ Starting Ping Storm ~~~ \e[0m"
		echo "    "
		if [[ $PING_PID -ne 0 ]] && ps -p $PING_PID >/dev/null; then
			echo -e "\e[1;31;40m Ping Storm is already running (PID: $PING_STORM) \e[0m"
			menu
		else
			./ping.sh >/dev/null &
			PING_PID=$!
			echo "Ping Storm started in background (PID : $PING_PID)"
			echo "Output is beingsaved to pingstorm.log"
			menu
		fi
		;;
	"Stop")
		##continue stop option##
		echo "    "
		if [[ $PING_PID -ne "0" ]]; then
			echo -e "\e[1;31;40m ~~~ Stoping Ping Storm ~~~ \e[0m"
			echo "    "
			kill $PING_PID
			echo "Ping Storm successfully stopped!"
			menu
			PING_PID=0
		else
			echo -e "\e[1;33;31m ~~~ Ping Storm is not running ~~~ \e[0m"
			PING_PID=0
			menu
		fi

		;;
	"Status")
		echo "    "
		echo -e "\e[1;33;40m ~~~ Ping Storm Status ~~~ \e[0m"
		./Res_analyzing.sh
		menu
		;;
	"Show")
		./show.sh
		;;
	"Quit")
		echo "    "
		echo "Exiting..."
		break
		;;
	*) echo "Invalid option" ;;
	esac
done
