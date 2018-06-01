#!/usr/bin/bash

# if [ "$EUID" -ne 0 ]
#   then echo "The script should be run under root"
#   exit
# fi

path=/sys/class/backlight/intel_backlight/
read -r currentBrightness < "$path"/actual_brightness
read -r maxBrightness < "$path"/max_brightness

step="$(( maxBrightness / 17 ))"

if [ "$1" = "up" ]; then
    echo "Increasing brightness"
    let "newBrightness = currentBrightness + step"
else
    echo "Decresing brightness $1"
    let "newBrightness = currentBrightness - step"
fi

if [ "$newBrightness" -gt "$maxBrightness" ]; then
    newBrightness=$maxBrightness
elif [ "$newBrightness" -lt 0 ]; then
    newBrightness=0
fi
echo "New brightness is $newBrightness"
# tee /sys/class/backlight/intel_backlight/brightness <<< $newBrightness
echo $newBrightness > /sys/class/backlight/intel_backlight/brightness
