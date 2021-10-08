# !/bin/sh
# Script to send an alert and poweroff pc when battery is discharging
# Created on 15/8/21

i3status | while :
do 
  read line
  cmd=$(echo $line | grep "BAT")
  if $cmd; 
  then
  notify-send $line -t 1000
#    echo "Discharging"
#    notify-send "Battery discharging" "Powering off in 2 seconds" -t 1000
#    sleep 5
#    notify-send "Powering off" -t 1000 #    poweroff
  fi
  echo $line
done



