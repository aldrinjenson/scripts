#! /bin/sh
# Script to disable keyboard for 1 minute or for the passed duration
# Created on 20/11/21

mouseId=13
masterId=2
# get the Ids using 'xinput list' command

# mouseId=$(xinput list | grep "AT Translated"| cut -d = -f2 | cut -f1)
duration=${1-1}

notify-send "Disabling keyboard $mouseId" "Duration: $duration minute"
xinput float $mouseId || notify-send "Error in disabling keyboard"
# sleep "$duration"m
# xinput reattach $mouseId $masterId

