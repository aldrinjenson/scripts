#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read -r line
        notify-send $line
        echo "mystuff | $line" || exit 1
done
