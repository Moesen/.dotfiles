# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

if ! pgrep -x polybar; then
	polybar base &
else
	pkill -USR1 polybar
fi

echo "Bars launched..."
