#!/bin/bash

pid_file="pingstorm.pid"
log_file="pingstorm.log"

while true; do
    echo ""
    echo "==== PingStorm Menu ===="
    echo "1) Start Monitoring"
    echo "2) Stop Monitoring"
    echo "3) Status"
    echo "4) Show Logs"
    echo "5) Quit"
    echo "========================"
    read -p "Choose an option (1-5): " choice

    case $choice in
        1)
            if [[ -f "$pid_file" && -s "$pid_file" ]]; then
                pid=$(cat "$pid_file")
                if ps -p "$pid" > /dev/null 2>&1; then
                    echo "Already running with PID: $pid"
                    continue
                fi
            fi
            ./ping.sh &
            echo $! > "$pid_file"
            echo "Started (PID: $(cat $pid_file))"
            ;;
        2)
            if [[ -f "$pid_file" ]]; then
                pid=$(cat "$pid_file")
                if ps -p "$pid" > /dev/null 2>&1; then
                    kill "$pid"
                    echo "Stopped (PID: $pid)"
                else
                    echo "Not running"
                fi
                rm -f "$pid_file"
            else
                echo "Not running"
            fi
            ;;
        3)
            if [[ -f "$pid_file" ]]; then
                pid=$(cat "$pid_file")
                if ps -p "$pid" > /dev/null 2>&1; then
                    echo "Running (PID: $pid)"
                else
                    echo "Not running"
                fi
            else
                echo "Not running"
            fi
            ;;
        4)
            echo ""
            echo "Last 10 log entries:"
            tail -n 10 "$log_file"
            ;;
        5)
            echo "Exiting PingStorm..."
            break
            ;;
        *)
            echo "Invalid option. Please enter a number between 1 and 5."
            ;;
    esac
done
