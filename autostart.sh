#!/bin/sh
fcitx5 -b
picom --experimental-backend -b
udiskie &
dunst &
pulseaudio -k && pulseaudio --start
