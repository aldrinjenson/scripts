#!/bin/bash
# script to give notification alert if battery is less
# created on 13-5-2023

# Get the current battery level
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

# notify-send "battery status = " $battery_level

# Check if the battery is charging
charging=$(cat /sys/class/power_supply/BAT0/status)


if [[ $charging = "Charging" ]]; then
  echo "charging fine. exiting.."
  exit 0
fi


if [ "$battery_level" -eq 100 ]; then
  notify-send -u critical "Battery at 100%. may want to unplug charger?"
  exit 0
fi

if [ "$battery_level" -lt 4 ]; then
  notify-send -u critical "Low battery! Shutting down in 10 seconds"
  sleep 10 
  poweroff
  exit 0
fi

if [ "$battery_level" -lt 10 ]; then
  notify-send -u critical "Low battery! Plug in your charger right now!!."
  exit 0
fi

if [ "$battery_level" -lt 15 ]; then
  notify-send "Low battery! Please plug in your charger."
  exit 0
fi

if [ "$battery_level" -lt 35 ]; then
  notify-send "Battery at 35%" "Would be a good idea to charge you laptop now:)"
fi
