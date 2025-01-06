#!/bin/bash

calc() {
  lines=$(grep -e "MemTotal" -e "MemAvailable" /proc/meminfo | awk '{print $2}')
  total=$(echo "$lines" | head -n 1)
  ava=$(echo "$lines" | tail -n 1)
  printf "%5s" "󰍛:$(((total - ava) * 100 / total))%"
}

outputFifo=$1
while true; do
  calc >"$outputFifo"
  sleep 1s
done
