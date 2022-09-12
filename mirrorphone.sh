#/usr/bin/sh
# Script to mirror android screen wirelessly after connecting it once using usb
# Created on 12/9/22

adb devices
phoneIp=$(adb shell ip route | awk '{print $9}' | grep 192)
adb tcpip 5555  
adb connect "$phoneIp:5555" 
scrcpy -S -w
