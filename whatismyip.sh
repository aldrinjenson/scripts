#!/bin/sh
# Script to show the ip address quickly
# Major update on  12/10/21

address=$(ip addr | awk '/192./ {print $2}' | cut -d'/' -f1)
echo "$address"
notify-send "$address" -t 4500
