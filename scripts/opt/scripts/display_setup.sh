#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --setprovideroutputsource Intel NVIDIA-0
xrandr --dpi 96
xrandr --auto

exit 0
