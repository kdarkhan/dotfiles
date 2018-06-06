xrdb -merge ~/.Xresources
export VISUAL=nvim
export EDITOR=$VISUAL
# xrandr --dpi 288
# xrandr --listproviders
xmodmap -e "keycode 107 = XF86Launch0"
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle,caps:none"
# export QT_SCALE_FACTOR=2.7 # for telegram-desktop
# export QT_AUTO_SCREEN_SCALE_FACTOR=2.7
# export GDK_SCALE=1 GDK_DPI_SCALE=1 CLUTTER_SCALE=1
exec awesome
