#!/bin/sh
# Script to connect to wifi in my nokia 8.1 phone hotspot
# updated on 2/10/21

nokiaId=$(getEnv.sh nokiaId)
nokiaPswd=$(getEnv.sh nokiaWifiPassword)
isConnected=0

# nmcli networking off && nmcli networking on # turning off and on to clear out current connection if any

nmcli dev wifi rescan &&
  sleep 1 &&
  nmcli device wifi connect "$nokiaId" password "$nokiaPswd" &&  notify-send "Connected" "Connected to Nokia 8.1" ||
  notify-send "Error in connecting to wifi"

# if (($isConnected == 0))
# then
# notify-send "Trying again"
# nmcli dev wifi rescan &&
# sleep 1 &&
# nmcli device wifi connect $nokiaId password $nokiaPswd &&
# notify-send "Connected" "Connected to Nokia 8.1" ||
# notify-send "Error in connecting to wifi"
# fi
