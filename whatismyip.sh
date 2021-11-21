# !/bin/sh
# Script to show the ip address quickly
# Major update on  12/10/21

address=$(ip addr | awk '/inet\s/ {print $2}')
echo $address
notify-send "$address" -t 4000

