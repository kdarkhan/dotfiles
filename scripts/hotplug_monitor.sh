export DISPLAY=:0
disp=eDP-1
disp2=HDMI-1
 
function connect(){
	xrandr > /dev/null
	# xrandr --output "$disp2" --right-of "$disp"
	# xrandr --output "$disp" --mode 2048x1152 --dpi 151 --output "$disp2" --auto --right-of "$disp"
	xrandr --output "$disp" --auto --dpi 283 --output "$disp2" --scale 2x2 --mode 1920x1080 --right-of "$disp"
	cur=$(xrandr | pcregrep -o1 "current (\w+ x \w+)")
	notify-send "Resolution with $disp2 is $cur"
}
 
function disconnect(){
	xrandr > /dev/null
	# xrandr --output "$disp2" --off --output "disp" --mode 2048x1152 --dpi 151
	# xrandr --output "disp2" --off
	xrandr --output "$disp" --auto --dpi 283 --output "$disp2" --off
	cur=$(xrandr | pcregrep -o1 "current (\w+ x \w+)")
	notify-send "Resolution without $disp2 is $cur"
}
 
xrandr | grep "$disp2 connected" &> /dev/null && connect || disconnect
