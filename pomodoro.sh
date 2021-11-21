# !/bin/sh
# Script to start a pomodoro timer and a break. Disables keyboard and reduces screen brightness after pomodoro duration untill break is completed.
# Created on  5/10/21
# dependencies: brightnessctl, node, dunst/libnotify

killall pomodoro.sh # restart timer if already running
killall safeeyes # disable safeeyes once pomodoro is active

duration=${1-25} # defaut pomodoro duration = 25m unless argument passed
breakDuration=${2-5}
prevBrightness=$(brightnessctl get)
# logFile="/home/aldrin/.scripts/assets/pomodoro-logs.txt"
audioAlertFile=$(getEnv.sh musicFile)

notify-send "Pomodoro started for $duration minutes." "Focus tight!!"
echo -e "Pomodoro active for $duration minutes\nFOCUS!!"

for (( i = $duration; i >= 0; i-- ))
do
  progressPercent=$(echo "($duration-$i)/$duration*100" | node -p)
  echo -n "$i"m out of "$duration" minutes left, "$progressPercent"% done $'\r' 

  if (( i == 0 ));
  then
    sleep 50
    notify-send "Break coming up for $breakDuration minutes in 10 seconds." "Get ready to relax"
  else
  sleep 1m
  fi
done

echo "\n"
echo Pomodoro done!!\nTake a break
notify-send "Pomodoro done!!" "Take rest Aldrin. It's necessary"
sleep 5 # wait 5 seconds after the notify message

brightnessctl set 1%
disableKeyboard.sh $breakDuration
# sleep "$breakDuration"m
brightnessctl set $prevBrightness

notify-send "Break completed" "Great Job. Your body is thankful to you :)"
safeeyes & # restart safeeyes once pomodoro is completed
vlc $audioAlertFile # audio alert

