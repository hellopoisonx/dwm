#!/bin/sh
PREFIX=/bin/sh\ /home/hpxx/dwm/scripts/
light=${PREFIX}light.sh
volume=${PREFIX}volume.sh
time=${PREFIX}time.sh
traffic=${PREFIX}traffic.sh

while xsetroot -name "$($time) | $($traffic) | $($light) | $($volume)"; do
    sleep 1
done
