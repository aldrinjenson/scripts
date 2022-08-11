#! /bin/sh
# Script to disable keyboard for 1 minute or for the passed duration
# Created on 20/11/21

keyboardId=15
masterId=3
# get the Ids using 'xinput list' command

keyboardId=$(xinput list | grep "AT Translated"| cut -d = -f2 | cut -f1)
echo $keyboardId
# keyboardId=5
duration=${1-1}

notify-send "Disabling keyboard $keyboardId" "Duration: $duration minute"
xinput float $keyboardId || notify-send "Error in disabling keyboard"
sleep "$duration"m
xinput reattach $keyboardId $masterId

