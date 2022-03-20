#!/bin/bash
# Created on 13/8/21
# Script to kill safeeyes when I'm presenting and bring it back up after 20 minutes

statusFile=/tmp/kls_status.txt
didKillOnce=$(cat $statusFile)

# if (( didKillOnce == 1 ))
# then
  # notify-send "Already postponed once. Not doing again!" "Take break now to restore skip status"
  # echo 0 > $statusFile
  # exit 0;
# fi
#
# killall safeeyes && notify-send "Killing safe-eyes" "Take break as soon as possible!!" || notify-send "Error in killing" "Cannot kill safeeyes"
# safeeyes
# echo 1 > $statusFile

notify-send "Nope, not killing" "It's all for your own good.."
