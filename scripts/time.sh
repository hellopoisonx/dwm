#!/bin/bash
while true; do
    echo ":$(date +%Y-%m-%d\ %H:%M:%S)" > "$1"
    sleep 1
done
