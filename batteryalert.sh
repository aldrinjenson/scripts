#!/bin/bash
# script to give notification alert if battery is less
# created on 13-5-2023

# Get the current battery level
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
b0_level=$(cat /sys/class/power_supply/BAT0/capacity)
b1_level=$(cat /sys/class/power_supply/BAT1/capacity)

total_bat_level=$(( b0_level + b1_level ))
total_bat_level=$( echo 'total_bat_level / 200' | bc )

# notify-send "battery level = $battery_level"

# Check if the battery is charging
charging=$(cat /sys/class/power_supply/BAT0/status)


if [[ $charging = "Charging" ]]; then
  echo "charging fine. exiting.."
  exit 0
fi


if [ "$battery_level" -eq 100 && "$charging" -ne "Charging"]; then
  notify-send -u critical "Battery at 100%. may want to unplug charger?"
  exit 0
fi

if [ "$battery_level" -lt 3 ]; then
  notify-send -u critical "Low battery! Shutting down in 10 seconds"
  sleep 10 
  poweroff
  exit 0
fi

if [ "$battery_level" -lt 10 ]; then
  notify-send -u critical "Low battery! Plug in your charger right now!!."
  playrandomsong.sh
  exit 0
fi

if [ "$battery_level" -lt 15 ]; then
  notify-send "Low battery! Please plug in your charger."
  exit 0
fi

if [ "$battery_level" -lt 35 ]; then
  notify-send "Battery at 35%" "Would be a good idea to charge you laptop now:)"
fi
