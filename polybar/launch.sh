killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

bars=(left okkertime mid right)
for bar in "${bars[@]}"; do 
    polybar $bar 2>&1 | tee -a /tmp/polybar-$bar.log & disown
done

# polybar left &
# polybar okkertime &
# polybar mid &
# polybar right &
