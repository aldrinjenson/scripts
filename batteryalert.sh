#!/bin/bash
# script to give notification alert if battery is less
# created on 13-5-2023

notify-send "working bro"
# Get the current battery level
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

# Check if the battery is charging
charging=$(cat /sys/class/power_supply/BAT0/status)

if [[ $charging = "Charging" ]]; then
  echo "charging fine. exiting.."
  exit 0
fi

# If the battery level is below 10%, send an alert
if [ $battery_level -lt 10 ]; then
  notify-send -u critical "Low battery! Plug in your charger right now!!."
  exit 0
fi

# If the battery level is below 10%, send an alert
if [ $battery_level -lt 15 ]; then
  notify-send "Low battery! Please plug in your charger."
fi
