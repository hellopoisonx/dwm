#!/bin/sh
light=$(light | grep -P '[0-9]?[0-9]?[0-9]' --only-matching | head -n 1)
echo ":$light"
