xrdb -merge ~/.Xresources
export VISUAL=nvim
export EDITOR=$VISUAL
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle,caps:none"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1 GDK_DPI_SCALE=1 CLUTTER_SCALE=1
exec awesome
