##!/usr/bin/sh
# Script to start a pomodoro timer and a break. Disables keyboard and reduces screen brightness after pomodoro duration untill break is completed.
# Created on  5/10/21
# dependencies: brightnessctl, node, dunst/libnotify

pgrep pomodoro.sh && killall pomodoro.sh # restart timer if already running
pgrep safeeyes && killall safeeyes       # disable safeeyes once pomodoro is active

duration=${1-25} # defaut pomodoro duration = 25m unless argument passed
breakDuration=${2-5}
prevBrightness=$(brightnessctl get)
musicFolder=$(getEnv.sh "musicFolder")
# audioAlertFile=$(find $musicFolder | shuf | head -1)
logFile=$(getEnv.sh pomodoroLog) # to be shown as time left in polybar

# function to add a daily log of total number of pomodoro minutes done
function incrementDailyMinCount() {
  dailyLogFile='/home/aldrin/.pomo.log'
  today=$(echo -n "$(date | cut -d' ' -f1-4)")
  totalMinutes=$(grep --text "$today" $dailyLogFile | cut -d " " -f7)
  if [ "$totalMinutes" = "" ]; then # if first entry of a day
    totalMinutes=1
  else
    sed -i '$ d' $dailyLogFile # delete previous entry(last line of file)
  fi
  today=$(echo -n "$(date | cut -d' ' -f1-4)")
  totalMinutes=$((totalMinutes + 1))
  h=$((totalMinutes / 60))
  m=$((totalMinutes % 60))
  echo $today - \( $totalMinutes mins \) $h hours $m minutes >>$dailyLogFile
}

function trapHandler() {
  echo "Exitting"
  echo -n "-1" >"$logFile"
  exit 0
}
trap trapHandler INT

# pomodoro logic begin ########################3

notify-send "Pomodoro started for $duration minutes." "Focus tight!!"
echo -e "Pomodoro active for $duration minutes\nFOCUS!!"

for ((i = duration; i > 0; i--)); do
  incrementDailyMinCount 1
  progressPercent=$(echo "($duration-$i)/$duration*100" | node -p)
  echo -n "$i"m out of "$duration" minutes left, "$progressPercent"% completed $'\r'
  echo -n "$i" >"$logFile"
  if ((i == 0)); then
    sleep 50
    notify-send "Break coming up for $breakDuration minutes in 10 seconds." "Get ready to relax"
  else
    sleep 1m
  fi
done

printf "\nPomodoro done!!\nTake a break"
notify-send "Pomodoro done!!" "Take rest Aldrin. It's necessary"
sleep 5 # wait 5 seconds after the notify message

brightnessctl set 1%
for ((i = breakDuration - 1; i >= 0; i--)); do
  echo -n "$i" >"$logFile"
  # sleep 1m
  disableKeyboard.sh 1
done

echo -n "-1" >"$logFile"
brightnessctl set "$prevBrightness"
notify-send "Break completed" "Great Job. Your body is thankful to you :)"

today=$(echo -n "$(date | cut -d' ' -f1-4)")
echo "$today"

safeeyes &                                      # restart safeeyes once pomodoro is completed
cd $musicFolder
audioAlertFile=$(ls | shuf | head -1)
vlc "$audioAlertFile"
# echo "$audioAlertFile" | xargs -I "()" vlc "()" # showing an audio alert

