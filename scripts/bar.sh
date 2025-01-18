#!/bin/bash
export light=""
export volume=""
export time=""
export traffic=" "
export mem="󰍛"
export caps_lock="  "

start_time=$(date --iso-8601=seconds)

result_prefix="/tmp/"
light_result="${result_prefix}light_result_$start_time"
volume_result="${result_prefix}volume_result_$start_time"
time_result="${result_prefix}time_result_$start_time"
traffic_result="${result_prefix}traffic_result_$start_time"
mem_result="${result_prefix}mem_result_$start_time"
caps_lock_result="${result_prefix}caps_lock_result_$start_time"

mkfifo -m=u+wr "$light_result" | exit
mkfifo -m=u+wr "$volume_result" | exit
mkfifo -m=u+wr "$time_result" | exit
mkfifo -m=u+wr "$traffic_result" | exit
mkfifo -m=u+wr "$mem_result" | exit
mkfifo -m=u+wr "$caps_lock_result" | exit

script_prefix="/home/hpxx/dwm/scripts/"
"${script_prefix}light.sh" "$light_result" &
"${script_prefix}volume.sh" "$volume_result" &
"${script_prefix}time.sh" "$time_result" &
"${script_prefix}traffic.sh" "$traffic_result" &
"${script_prefix}mem.sh" "$mem_result" &
"${script_prefix}caps_lock.sh" "$caps_lock_result" &

while xsetroot -name "$caps_lock | $traffic | $mem | $light | $volume | $time"; do
  light=$(head -n 1 "$light_result")
  traffic=$(head -n 1 "$traffic_result")
  time=$(head -n 1 "$time_result")
  volume=$(head -n 1 "$volume_result")
  mem=$(head -n 1 "$mem_result")
  caps_lock=$(head -n 1 "$caps_lock_result")
done
