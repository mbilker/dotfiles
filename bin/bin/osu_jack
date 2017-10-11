#!/bin/sh

# loop client creation
/usr/bin/alsa_in -j osu -dosu_capture -q 1 2>&1 1>/dev/null &

# give it some time before connecting to system ports
sleep 1

# cloop ports -> jack output ports
jack_connect osu:capture_1 system:playback_1
jack_connect osu:capture_2 system:playback_2

# done
exit 0
