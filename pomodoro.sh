# !/bin/sh
# Script to start a pomodoro timer
# Created on  5/10/21

duration=${1-25}
logFile="/home/aldrin/.scripts/assets/pomodoro-logs.txt"
audioAlertFile="/home/aldrin/Music/The-Cup-of-life.mp3"

notify-send "Pomodoro started for $duration minutes." "Focus tight!!"
 
echo "Pomodoro active for $duration minutes\nFOCUS!!"

for (( i = $duration; i >= 0; i-- ))
do
#  progress=$(( i/duration ))
  progressPercent=$(echo "($duration-$i)/$duration*100" | node -p)

  echo -n "$i"m out of "$duration" minutes left, "$progressPercent"% done $'\r' 
  notify-send "Pomodoro: $i out of "$duration" minutes left" "$progressPercent% done. FOCUS" -t 60099
  sleep 1m
done

echo "\n"
echo Pomodoro done!!\nTake a break
notify-send "Pomodoro done!!" "Take rest Aldrin. It's necessary"
vlc $audioAlertFile


