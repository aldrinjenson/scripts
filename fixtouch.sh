#! /bin/sh
# Script to disable keyboard for 1 minute or for the passed duration
# Created on 20/11/21

clientId=15
masterId=2
# get the Ids using 'xinput list' command

# clientId=$(xinput list | grep "AT Translated"| cut -d = -f2 | cut -f1)
duration=${1-1}

notify-send "Disabling Touchscreen $clientId" "Duration: $duration minute"
xinput disable $clientId || notify-send "Error in disabling keyboard"
sleep 0.5
xinput reattach $clientId $masterId

