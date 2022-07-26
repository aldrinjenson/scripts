#!/bin/sh
# Script to set a proverb quote as the desktop wallpaper
# Created on30/9/21

bgImage=$(getEnv.sh wallpaperBg)
imagePath=$(getEnv.sh bibleBg)
xwallpaper --center $imagePath
# set wallpaper first as generating image will take some time

verse="$(proverbQuote.sh)"
# convert -size 500x200 -background white -font arial -fill black -gravity center caption:"This is a title that will be fairly long and I want it to fit nicely" -bordercolor red -border 1 test3.png

convert -background none -size 800x200 -gravity center -fill black caption:"$verse" image.png
composite image.png $bgImage -gravity center $imagePath
rm image.png
