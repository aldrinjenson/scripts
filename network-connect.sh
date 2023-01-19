#!/bin/bash
# script to save the current ip and network connection to a remote server
#created on 14/1/23

currentIp="$(ifconfig | grep 192 | awk '{print $2}' | head -1)"
currentWifiSSID="$(iwgetid -r)"
token=1234
key="archie"

data="{\"ip\":\"$currentIp\",\"ssid\":\"$currentWifiSSID\",\"key\":\"$key\",\"token\":$token, \"date\": \"$(date)\"}"

curl -X POST -H "Content-Type: application/json" -d "$data" https://xxm3n1.deta.dev/db

if [ $? -eq 0 ]; then
  notify-send "Updated ip in cloud" 
  echo "Successful"
else
  echo "Failed"
  notify-send "Error in updating in cloud"
fi
