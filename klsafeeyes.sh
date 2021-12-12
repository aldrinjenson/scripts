#! /bin/bash
# Created on 13/8/21
# Script to kill safeeyes when I'm presenting and bring it back up after 20 minutes

killall safeeyes && notify-send "Killing safe-eyes" "Take break as soon as possible!!" || notify-send "Error in killing" "Cannot kill safeeyes"
safeeyes

# notify-send "Nope, not killing" "It's all for your own good.."
