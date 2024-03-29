#!/bin/sh
# Script to create a timer for the entered minutes; Defaults to 5 mins if no argument is passed
# Created on  22/8/21

mins=${1-5}  # if no arg is passed, set default timer to 5 mins
notify-send "Timer active" "Timer started for $mins minutes"
sleep "$mins"m
notify-send "Timer done" "$mins minutes have been completed"

musicFolder=$(getEnv.sh "musicFolder")
cd "$musicFolder" || notify-send "Error in finding folder"
audioAlertFile=$(ls | shuf | head -1)
vlc "$audioAlertFile"
