#!/bin/sh

BRIGHTNESS_FILE=/sys/class/backlight/intel_backlight/brightness
MODIFIER=0

OPERATION=$1

case $OPERATION in
  up)
    MODIFIER=50
    ;;
  down)
    MODIFIER=-50
    ;;
  *)
    ;;
esac

CURRENT_BRIGHTNESS="$(< $BRIGHTNESS_FILE)"
NEW_BRIGHTNESS="$CURRENT_BRIGHTNESS + $MODIFIER"

echo "$NEW_BRIGHTNESS" | bc | sudo tee $BRIGHTNESS_FILE
