#!/bin/sh
PREFIX=/bin/sh\ /home/hpxx/dwm/scripts/
light=${PREFIX}light.sh
volume=${PREFIX}volume.sh
time=${PREFIX}time.sh
while xsetroot -name "$($time) | $($light) | $($volume)"; do
    sleep 0.5
done
