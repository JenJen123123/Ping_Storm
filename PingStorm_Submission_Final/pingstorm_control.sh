#!/bin/bash

pid_file="pingstorm.pid"
main_script="pingstorm.sh"
log_file="pingstorm.log"

log() {
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  module="$1"
  message="$2"
  echo "[$timestamp] [$module] $message" >> "$log_file"
}

log "CONTROL" "Command: $1"

if [ "$1" = "start" ]; then
  if [ -f "$pid_file" ] && ps -p "$(cat $pid_file)" > /dev/null; then
    echo "Already running (PID: $(cat $pid_file))"
    exit 0
  fi
  bash "$main_script" &
  echo $! > "$pid_file"
  log "CONTROL" "Started (PID: $(cat $pid_file))"
  echo "Started (PID: $(cat $pid_file))"
fi

if [ "$1" = "stop" ]; then
  if [ -f "$pid_file" ]; then
    pid=$(cat "$pid_file")
    kill "$pid" 2>/dev/null
    rm -f "$pid_file"
    log "CONTROL" "Stopped (PID: $pid)"
    echo "Stopped (PID: $pid)"
  else
    echo "Not running"
  fi
fi

if [ "$1" = "status" ]; then
  if [ -f "$pid_file" ] && ps -p "$(cat $pid_file)" > /dev/null; then
    echo "Running (PID: $(cat $pid_file))"
  else
    echo "Not running"
  fi
fi

if [ "$1" = "log" ]; then
  tail -n 10 "$log_file"
fi
