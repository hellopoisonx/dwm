#!/bin/sh
fcitx5 -d
picom --experimental-backend --config ~/.config/picom.conf -b
python ~/dwm/script/background.py
~/lemonbar/__init__.py
diskie &
dunst &
pulseaudio -k ; sleep 2s ;pulseaudio --start
