#!/bin/bash
while true; do
    status="$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')"
    if [ "$status" == "off" ]; then
        echo "  " > "$1"
    else 
        echo "  " > "$1"
    fi
    sleep 1
done
