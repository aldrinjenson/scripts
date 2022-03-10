# !/bin/sh
# Script to swap caps lock to escape
# Created on 16/9/21

xdotool key "Escape" && setxkbmap -option caps:escape
# xmodmap ~/.scripts/swapkeys -display :0
