#! /bin/sh
#Created on 3/8/21
#Script to log minutes of time spent in computer each day


monitorStatus=$(xset -q|sed -ne 's/^[ ]*Monitor is //p')
echo $monitorStatus
if [[ $monitorStatus = 'Off'  ]]
then
  notify-send "Monitor off" "In screensaver mode"
  exit 0
  #  exit if the display is off due to timeout
fi

logFile='/home/aldrin/.scripts/assets/.logs.txt'
today=$(echo -n "$(date | cut -d' ' -f1-4)")
totalMinutes=$(grep "$today" $logFile | cut -d " " -f7)

if [ "$totalMinutes" =  "" ]    # if first entry of a day
then
  totalMinutes=1
else
  sed -i '$ d' $logFile         # delete previous entry(last line of file)
fi

totalMinutes=$(( totalMinutes + 1))
h=$((totalMinutes/60))
m=$((totalMinutes%60))

echo $today - \( $totalMinutes mins \) $h hours $m minutes >> $logFile

