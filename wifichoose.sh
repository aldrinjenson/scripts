#!/usr/bin/sh
# script to connect to a wifi network using dmenu
# Created on 22/9/22

chosenWifi=$(nmcli device wifi | awk 'NR>1{print $2, $1}' | dmenu -i | awk '{print $1}'
)
echo $chosenWifi

nmcli device wifi connect "$chosenWifi"
