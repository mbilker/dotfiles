#!/bin/sh

# Early exit if no Intel HD Graphics device present
test -z "$(/usr/sbin/lspci | grep "HD Graphics")" && exit 0

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --setprovideroutputsource Intel NVIDIA-0
xrandr --dpi 96
xrandr --auto

exit 0
