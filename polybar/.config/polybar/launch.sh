#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar -q top &
#MONITOR=DP-1 polybar -q bottom &
#MONITOR=DP-3.1 polybar -q multimonitor &
MONITOR=DP-1 polybar -q bottom &
MONITOR=DP-3.1 polybar -q bottom &
MONITOR=DP-3.2 polybar -q bottom &
MONITOR=DP-3.3 polybar -q multimonitor &
MONITOR=DP-4 polybar -q bottom &
polybar -q bottom &

echo "Bars launched..."
