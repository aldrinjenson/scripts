# !/bin/sh
# Script to show the ip address quickly
# Major update on  12/10/21

address=$(ifconfig | awk '/inet\s/ {print $2}')
echo $address
notify-send "$address" -t 4000

