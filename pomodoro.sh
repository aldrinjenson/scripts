# !/usr/bin/bash
# Script to start a pomodoro timer and a break. Disables keyboard and reduces screen brightness after pomodoro duration untill break is completed.
# Created on  5/10/21
# dependencies: brightnessctl, node, dunst/libnotify

pgrep pomodoro.sh && killall pomodoro.sh # restart timer if already running
pgrep safeeyes && killall safeeyes # disable safeeyes once pomodoro is active

duration=${1-25} # defaut pomodoro duration = 25m unless argument passed
breakDuration=${2-5}
prevBrightness=$(brightnessctl get)
audioAlertFile=$(getEnv.sh musicFile)
logFile=$(getEnv.sh pomodoroLog)

notify-send "Pomodoro started for $duration minutes." "Focus tight!!"
echo -e "Pomodoro active for $duration minutes\nFOCUS!!"

for (( i = duration; i > 0; i-- ))
do
  progressPercent=$(echo "($duration-$i)/$duration*100" | node -p)
  echo -n "$i"m out of "$duration" minutes left, "$progressPercent"% completed $'\r' 
  echo -n "$i" > "$logFile"

  if (( i == 0 ));
  then
    sleep 50
    notify-send "Break coming up for $breakDuration minutes in 10 seconds." "Get ready to relax"
  else
  sleep 1m
  fi
done

printf "\n"
printf "Pomodoro done!!\nTake a break"
notify-send "Pomodoro done!!" "Take rest Aldrin. It's necessary"
sleep 5 # wait 5 seconds after the notify message

brightnessctl set 1%
for (( i = breakDuration -1 ; i >= 0; i-- ))
do
  echo -n "$i" > "$logFile"
  # sleep 1m
  disableKeyboard.sh 1
done

echo -n "$i" > "$logFile"
brightnessctl set "$prevBrightness"
notify-send "Break completed" "Great Job. Your body is thankful to you :)"
safeeyes & # restart safeeyes once pomodoro is completed

echo "$audioAlertFile" | xargs -I "()" vlc "()" # showing an audio alert

