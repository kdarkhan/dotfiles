#!/bin/sh -e

pgrep redshift || redshift-gtk -l "$COORDS" -c .config/redshift/redshift.conf  &

pgrep nm-applet || nm-applet &

pgrep picom || picom &

pgrep kbdd || kbdd &

# pgrep conky || conky &

xset r rate 250 40
