#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Thank you StackExchange for the wonderful post on retrieving a list of attached monitors via XRandr
# https://codereview.stackexchange.com/questions/208466/bash-script-to-configure-monitors-on-linux-via-xrandr

declare -ar ALL_CONNECTED=( $({ xrandr -q || exit 1; } | awk '$2 == "connected" { print $1 }') )
if [ ${#ALL_CONNECTED[@]} -eq 0 ]; then
	echo "no monitors connected"
	exit 1
fi

declare PRIMARY_MONITOR="$(xrandr -q | awk '$2 == "connected" && $3 == "primary" { print $1 }')"
if [ -z "$PRIMARY_MONITOR" ]; then
	exit 1
fi

echo "
ALL_CONNECTED: ${ALL_CONNECTED[@]}
PRIMARY_MONITOR: ${PRIMARY_MONITOR}
"

MONITOR="$PRIMARY_MONITOR" polybar -q bottom &

for monitor in ${ALL_CONNECTED[@]}
do
	if [[ "$monitor" != "${PRIMARY_MONITOR}" ]]; then
		MONITOR="$monitor" polybar -q multimonitor &
	fi
done

# Launch bar1 and bar2
#polybar -q top &
#polybar -q bottom &

echo "Bars launched..."
