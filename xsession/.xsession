#!/bin/sh

for unit in $(systemctl --user --no-legend --state=failed list-units | cut -f1 -d' '); do
  if [ "$(systemctl --user show -p PartOf --value)" = "window-manager.service" ]; then
    systemctl --user reset-failed $unit
  fi
done

# --wait support added in systemd 232
systemctl --user start --wait window-manager.service 2>&1 >> "$LOG"

#systemctl --user restart window-manager.service 2>&1 >> "$LOG"

#while systemctl --user --quiet is-active window-manager.service; do sleep 4; done

#while [ -n "$(systemctl --user --no-legend --state=deactivating list-units)" ]; do sleep 0.5; done

#sleep 5
exit 0
