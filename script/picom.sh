#!/bin/sh
PIDS=$(ps -ef | rg "picom --experimental-backend" | rg -v rg| awk '{print $2}')
if [ -n "$PIDS" ]; then
  killall picom
else
  picom --experimental-backend --config ~/.config/picom.conf -b
fi
