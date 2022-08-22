#! /bin/sh
# Connect to wifi.
# created on 8/7/21

status=$(wifi)
if [[ status = 'On' ]]
then
  notify-send "Already connected to wifi"
  exit 0
fi

wifiInterface=$(ifconfig  | grep wlan | cut -d':' -f1)
echo $wifiInterface

nmcli device connect $wifiInterface && notify-send "Connected " || notify-send "Error" "Error in connecting to wifi"


