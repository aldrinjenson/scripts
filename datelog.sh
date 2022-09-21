#!/usr/bin/sh
# Created on 3/8/21
# Script to log minutes of time spent in computer each day

# monitorStatus=$(xset -q | sed -ne 's/^[ ]*Monitor is //p')
# if [[ $monitorStatus = 'Off' ]]; then
#   notify-send "Monitor off" "In screensaver mode"
#   exit 0
#   #  exit if the display is off due to timeout
# fi

notify-send "inside"
logFile=$(getEnv.sh dateLogFile)
echo $logFile
notify-send $logFile
# today=$(echo -n "$(date | cut -d' ' -f1-4)")
totalMinutes=$(cat $logFile | grep "$(date | cut -d' ' -f4)"| cut -d " " -f6)

if [ "$totalMinutes" = "" ]; then # if first entry of a day
  totalMinutes=1
else
  sed -i '$ d' $logFile # delete previous entry(last line of file)
fi

totalMinutes=$((totalMinutes + 1))
h=$((totalMinutes / 60))
m=$((totalMinutes % 60))

echo $today - \( $totalMinutes mins \) $h hours $m minutes >>$logFile
notify-send "$today - \( $totalMinutes mins \) $h hours $m minutes "
