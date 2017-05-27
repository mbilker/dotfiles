#!/bin/bash

FIRST_EXTERNAL="DP-3.3"
#FIRST_EXTERNAL="DP-3.1"
FIRST_EXTERNAL_SETTING="1280x1024 +0+0"
FIRST_EXTERNAL_HORIZONTAL_SIZE="1280"
SECOND_EXTERNAL="DP-3.1"
#SECOND_EXTERNAL="DP-3.2"
SECOND_EXTERNAL_SETTING="nvidia-auto-select +${FIRST_EXTERNAL_HORIZONTAL_SIZE}+0"
PRIMARY_EXTERNAL="${SECOND_EXTERNAL}"
EXTERNAL_METAMODE="${FIRST_EXTERNAL}: ${FIRST_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }, ${SECOND_EXTERNAL}: ${SECOND_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }"
#EXTERNAL_METAMODE="${FIRST_EXTERNAL}: ${FIRST_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }"
#LCD_SCREEN="DP-4"
LCD_SCREEN="eDP-1-1"

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
    #/usr/bin/nvidia-settings -a CurrentMetaMode="${LCD_SCREEN}: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
    /usr/bin/xrandr --output "${LCD_SCREEN}" --primary --auto --output "${FIRST_EXTERNAL}" --off --output "${SECOND_EXTERNAL}" --off
    for id in $TRACKPOINT_IDS; do
      /usr/bin/xinput set-int-prop "${id}" "Device Enabled" 8 1
    done
    /usr/bin/xinput set-int-prop "${TOUCHPAD}" "Device Enabled" 8 1
    /usr/bin/xinput set-int-prop "${TOUCHSCREEN}" "Device Enabled" 8 1
    ;;
  "1")
    # docked
    /usr/bin/xrandr --output "${LCD_SCREEN}" --off
    /usr/bin/nvidia-settings -a CurrentMetaMode="${EXTERNAL_METAMODE}"
    /usr/bin/xrandr --output "${PRIMARY_EXTERNAL}" --primary
    for id in $TRACKPOINT_IDS; do
      /usr/bin/xinput set-int-prop "${id}" "Device Enabled" 8 0
    done
    /usr/bin/xinput set-int-prop "${TOUCHPAD}" "Device Enabled" 8 0
    /usr/bin/xinput set-int-prop "${TOUCHSCREEN}" "Device Enabled" 8 0
    ;;
esac
