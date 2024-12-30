#!/bin/bash
calc() {
    if [ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ]; then
        echo ""
    else
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ \
            | grep -P '[0-9]?[0-9]?[0-9]\%' --only-matching \
            | head -n 1 \
            | grep -P '[0-9]?[0-9]?[0-9]' --only-matching)
        if [ "$vol" -lt 20 ]; then
            echo ":$vol%"
        else
            echo ":$vol%"
        fi
    fi
}

while true; do
    calc > "$1"
    sleep 1
done
