#! /bin/sh
# Script to disable keyboard for 1 minute or for the passed duration
# Created on 20/11/21

keyboardId=10
masterId=3
# get the Ids using xinput list

duration=${1-1}

notify-send "Disabling keyboard" "Duration: $duration"
xinput float $keyboardId
sleep "$duration"m
xinput reattach $keyboardId $masterId

