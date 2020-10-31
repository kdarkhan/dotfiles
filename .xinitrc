xrdb -merge ~/.Xresources
export VISUAL=nvim
export EDITOR=$VISUAL
export TERMINAL=kitty
xmodmap -e "keycode 107 = XF86Launch0"

# setxkbmap -layout "us,ru" -model pc104 -option "grp:alt_shift_toggle,caps:escape"
# export QT_SCALE_FACTOR=2.7 # for telegram-desktop
# export QT_AUTO_SCREEN_SCALE_FACTOR=2.7
# export GDK_SCALE=1 GDK_DPI_SCALE=1 CLUTTER_SCALE=1

#dbus-update-activation-environment --systemd DISPLAY
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

exec i3
