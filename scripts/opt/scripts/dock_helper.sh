#!/bin/bash

FIRST_EXTERNAL="DP-3.2"
FIRST_EXTERNAL_SETTING="nvidia-auto-select +0+0"
FIRST_EXTERNAL_HORIZONTAL_SIZE="1920"
SECOND_EXTERNAL="DP-3.1"
SECOND_EXTERNAL_SETTING="nvidia-auto-select +${FIRST_EXTERNAL_HORIZONTAL_SIZE}+0"
LCD_SCREEN="DP-4"

TRACKPOINT="TPPS/2 IBM TrackPoint"
TOUCHPAD="SynPS/2 Synaptics TouchPad"
TOUCHSCREEN="Wacom Co.,Ltd. Pen and multitouch sensor Finger touch"

logger "Running dock/undock script"

TRACKPOINT_IDS=$(xinput --list | awk -v search="$TRACKPOINT" \
  '$0 ~ search { match($0, /id=[0-9]+/); \
    if (RSTART) \
      print substr($0, RSTART + 3, RLENGTH - 3) \
  }' \
)

case "$1" in
  "0")
    # undocked
    /usr/bin/nvidia-settings -a CurrentMetaMode="${LCD_SCREEN}: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
    /usr/bin/xrandr --output "${LCD_SCREEN}" --primary
    for id in $TRACKPOINT_IDS; do
      /usr/bin/xinput set-int-prop "${id}" "Device Enabled" 8 1
    done
    /usr/bin/xinput set-int-prop "${TOUCHPAD}" "Device Enabled" 8 1
    /usr/bin/xinput set-int-prop "${TOUCHSCREEN}" "Device Enabled" 8 1
    ;;
  "1")
    # docked
    /usr/bin/nvidia-settings -a CurrentMetaMode="${FIRST_EXTERNAL}: ${FIRST_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }, ${SECOND_EXTERNAL}: ${SECOND_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }"
    /usr/bin/xrandr --output "${FIRST_EXTERNAL}" --primary
    for id in $TRACKPOINT_IDS; do
      /usr/bin/xinput set-int-prop "${id}" "Device Enabled" 8 0
    done
    /usr/bin/xinput set-int-prop "${TOUCHPAD}" "Device Enabled" 8 0
    /usr/bin/xinput set-int-prop "${TOUCHSCREEN}" "Device Enabled" 8 0
    ;;
esac
