# !/bin/sh
#Script to power off computer if time is between 12pm and 6 am or from 5pm to 5.30pm automatically
#Created on around ~7-9-2021

currHr=$(date +"%H")
currMin=$(date +"%M")
#if [[ $currHr -lt "06" || $currHr -eq '05' && $currMin -lt "30"]]
if [[ $currHr -lt "06" ]];
then
# notify-send 'Time over!!' "Shutting down in a few seconds" -t 2000 --icon=dialog-information
# sleep 10;
# poweroff;
fi

