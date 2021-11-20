# !/bin/sh
# Script to connect to wifi in my nokia 8.1 phone hotspot
# updated on 2/10/21

nokiaId=$(getEnv.sh nokiaId)
nokiaPswd=$(getEnv.sh nokiaWifiPassword)

nmcli dev wifi rescan && 
  sleep 1 && 
  nmcli device wifi connect $nokiaId password $nokiaPswd && 
  notify-send "Connected" "Connected to Nokia 8.1" || 
  notify-send "Error in connecting to wifi"


