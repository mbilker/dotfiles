#!/bin/bash

# wait for the dock state to change
sleep 1
USERS="$(last | grep still | cut -d " " -f1 | uniq | grep -v reboot)"

for user in "${USERS}"; do
  case "$1" in
    "0")
      # undocked
      logger 'undocked'
      DISPLAY=:0.0 su "${user}" -c "bash /opt/scripts/dock_helper.sh $1"
      ;;
    "1")
      # docked
      logger 'docked'
      DISPLAY=:0.0 su "${user}" -c "bash /opt/scripts/dock_helper.sh $1"
      ;;
  esac
done

exit 0
