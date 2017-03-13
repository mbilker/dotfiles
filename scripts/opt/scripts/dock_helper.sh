#!/bin/bash

FIRST_EXTERNAL="DP-3.2"
FIRST_EXTERNAL_SETTING="nvidia-auto-select +0+0"
FIRST_EXTERNAL_HORIZONTAL_SIZE="1920"
SECOND_EXTERNAL="DP-3.1"
SECOND_EXTERNAL_SETTING="nvidia-auto-select +${FIRST_EXTERNAL_HORIZONTAL_SIZE}+0"
LCD_SCREEN="DP-4"

logger "Running dock/undock script"

case "$1" in
  "0")
    # undocked
    /usr/bin/xrandr --output "${LCD_SCREEN}" --primary
    /usr/bin/nvidia-settings -a CurrentMetaMode="${LCD_SCREEN}: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
    ;;
  "1")
    # docked
    /usr/bin/xrandr --output "${FIRST_EXTERNAL}" --primary
    /usr/bin/nvidia-settings -a CurrentMetaMode="${FIRST_EXTERNAL}: ${FIRST_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }, ${SECOND_EXTERNAL}: ${SECOND_EXTERNAL_SETTING} { ForceFullCompositionPipeline = On }"
    ;;
esac
