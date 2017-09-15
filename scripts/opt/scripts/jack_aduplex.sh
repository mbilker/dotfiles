#!/bin/sh

# loop client creation
/usr/bin/alsa_in -j cloop -dcloop -q 1 2>&1 1>/dev/null &

# give it some time before connecting to system ports
sleep 1

# cloop ports -> jack output ports
jack_connect cloop:capture_1 system:playback_1
jack_connect cloop:capture_2 system:playback_2

# done
exit 0
