#! /bin/sh
# Created on 8/7/21
# Script to list bluetooth devices and connect to them easily

device=$(bluetoothctl devices | cut -d' ' -f2- |  dmenu -i)
notify-send "Connecting" "Attempting to connect to bluetooth device" -t 2000
macAddrs=$( echo $device | cut -d ' ' -f1 )
bluetoothctl connect $macAddrs && notify-send "Connected" "Successfully Connected to bluetooth device"



