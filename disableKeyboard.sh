#! /bin/sh
# Script to disable keyboard for 1 minute or for the passed duration
# Created on 20/11/21

keyboardId=13
masterId=3
# get the Ids using 'xinput list' command

duration=${1-1}

notify-send "Disabling keyboard" "Duration: $duration minute"
xinput float $keyboardId || notify-send "Error in disabling keyboard"
sleep "$duration"m
xinput reattach $keyboardId $masterId

