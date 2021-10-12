#!/bin/sh
# Script to stream audio to android app using pulseAudio
# Created on 10/10/21
# Note: The initial core logic is from stack-overflow

#Check source using: pactl list sources | grep monitor

appName="SimpleProtocolPlayer" # android app to play the audio stream
ip=$(/home/aldrin/.scripts/whatismyip.sh | sed -n 2p)
port=8000

if [[ -z $1 ]];
then
  $0 stop
  pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor record=true port=$port && notify-send "Audio server active" "Open $appName in Android and connect to $ip port $port" || notify-send "Error in starting audio server!"
  exit 0
fi

case "$1" in
  stop)
    pactl unload-module `pactl list | grep tcp -B1 | grep M | sed 's/[^0-9]//g'` && notify-send "Audio server stopped"
    ;;
esac
