#!/bin/sh

# unload PulseAudio JACK client
pacmd unload-module module-jack-sink 2>&1 1>/dev/null
pacmd unload-module module-jack-source 2>&1 1>/dev/null

# PulseAudio JACK client creation
pacmd load-module module-jack-sink channels=2
pacmd load-module module-jack-source channels=2

# set PulseAudio default sink to JACK
pacmd set-default-sink jack_out

# loop client creation
#/usr/bin/alsa_out -j ploop -dploop -q 1 2>&1 1>/dev/null &
#/usr/bin/alsa_in -j  cloop -dcloop -q 1 2>&1 1>/dev/null &
/usr/bin/alsa_in -j osu -dosu_capture -q 1 2>&1 1>/dev/null &

# give it some time before connecting to system ports
sleep 1

# cloop ports -> jack output ports
#jack_connect cloop:capture_1 system:playback_1
#jack_connect cloop:capture_2 system:playback_2
jack_connect osu:capture_1 system:playback_1
jack_connect osu:capture_2 system:playback_2

# done
exit 0
