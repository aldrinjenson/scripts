#!/usr/bin/sh
# script to connect to a wifi network using dmenu
# Created on 22/9/22

chosenWifiSSID="$(nmcli device wifi | awk 'NR>1{print $2, $1}' | dmenu -i | awk '{print $2}')"
echo $chosenWifiSSID

nmcli device wifi connect "$chosenWifiSSID"
