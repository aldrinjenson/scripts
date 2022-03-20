#!/bin/sh
# Script to take the input file and set it as wallpaper
# Created on  11/9/21

if [ -n "$1" ]; 
then
  xwallpaper --center "$1" && notify-send "$1 set as wallpaper" || notify-send "Error in setting wallpaper. Verify imgFile again"
  exit 1
else
  notify-send "No image file given"
fi

