# Script to disable keyboard for 1 minute or for the passed duration
#! /bin/sh
# Created on 20/11/21

# keyboardId=15
duration=${1-1}
masterId=3
# get the Ids using 'xinput list' command

keyboardId=$(xinput list | grep "Logitech USB Keyboard" | head -n1 | cut -d = -f2 | cut -f1)

# incase logitech keyboard is not plugged in, disable the default Thinkpad keyboard
if [[ -z $keyboardId ]];
then
  keyboardId=$(xinput list | grep "AT Translated Set 2 keyboard "| cut -d = -f2 | cut -f1)
fi

echo "KeyboardID = $keyboardId"

notify-send "Disabling keyboard $keyboardId" "Duration: $duration minute"
xinput float "$keyboardId" || notify-send "Error in disabling keyboard"
sleep "$duration"m
# xinput set-prop $device_id "Device Enabled" 1
xinput reattach "$keyboardId" "$masterId"
