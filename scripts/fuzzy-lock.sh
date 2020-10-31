#!/bin/bash -e

shopt -s extglob
set -e
# Take a screenshot

pgrep swaylock && exit 0
# swaygrab /tmp/screen_locked.jpeg
grim -t jpeg -q 50 /tmp/screen_locked.jpeg


# Pixellate it 10x
# mogrify -scale 5% -scale 2000% /tmp/screen_locked.png
convert  /tmp/screen_locked.jpeg -blur 0x9 /tmp/screen_locked.jpeg


# Lock screen displaying this image.
swaylock -i /tmp/screen_locked.jpeg --indicator-radius 100 --indicator-thickness 25 &

# Turn the screen off after a delay.
# sleep 10; pgrep swaylock && xset dpms force off 
# sleep 60; pgrep swaylock && systemctl suspend
