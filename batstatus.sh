#!/bin/bash
# script to get total battery level of both batteries combined
# created on 3-6-2023

b0_level=$(cat /sys/class/power_supply/BAT0/capacity)
b1_level=$(cat /sys/class/power_supply/BAT1/capacity || echo 0)

battery_level=$(( ( b0_level + b1_level ) / 2 ))
charging=$(cat /sys/class/power_supply/BAT0/status || cat /sys/class/power_supply/BAT1/status)

echo "Average battery level = $battery_level%"
notify-send "Average battery level = $battery_level%" "Charging status = $charging"

