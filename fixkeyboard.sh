#!/bin/bash
# Script to fix an external keyboard layout + capslock swapping
# created on 23/9/22

setxkbmap -layout us -variant ,qwerty # for setting layout
xdotool key "Escape" && setxkbmap -option caps:escape  # for swapping caps with escape
