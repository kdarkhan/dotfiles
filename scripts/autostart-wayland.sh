#!/bin/bash -e

pgrep redshift || redshift -m wayland -l "$COORDS" &

pgrep swayidle || swayidle \
	timeout 240 '/home/dark/scripts/fuzzy-lock.sh' \
	timeout 600 'swaymsg "output * dpms off"' \
	timeout 700 'systemctl suspend' \
	resume 'swaymsg "output * dpms on"' &
