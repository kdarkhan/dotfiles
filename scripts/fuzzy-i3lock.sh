#!/bin/bash

set -ex
# Take a screenshot

existing_proc=$(pgrep i3lock)

[ ! -z "$existing_proc" ] || exit 0

# SCREENSHOT
rm -f /tmp/screen_locked.png
scrot /tmp/screen_locked.png


# BLUR
# mogrify -scale 5% -scale 2000% /tmp/screen_locked.png
convert  /tmp/screen_locked.png -blur 0x5 /tmp/screen_locked.png


# LOCK
# swaylock -i /tmp/screen_locked.jpeg --indicator-radius 100 --indicator-thickness 25 &
i3lock -i /tmp/screen_locked.png --nofork -e -f
