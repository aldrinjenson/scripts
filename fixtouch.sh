#! /bin/sh
# Script to disable keyboard for 1 minute or for the passed duration
# Created on 20/11/21

# clientId=11
masterId=2
# get the Ids using 'xinput list' command

clientId=$(xinput list | grep "Multi"| cut -d = -f2 | cut -f1)
echo $clientId
duration=${1-1}

# echo $clientId
(xinput disable $clientId && notify-send "Disabling Touchscreen $clientId" "Duration: $duration minute" )  || notify-send "Error in disabling keyboard"
sleep 0.5
# xinput reattach $clientId $masterId

