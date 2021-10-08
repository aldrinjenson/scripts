#! /bin/sh
# Connect to wifi. 
# created on 8/7/21

status=$(wifi)
if [[ status = 'On' ]]
then
  notify-send "Already connected to wifi"
  exit 0
fi

nmcli device connect wlan0 && notify-send "Connected " || notify-send "Error" "Error in connecting to wifi"


