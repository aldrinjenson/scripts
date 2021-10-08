# !/bin/sh
# Script to set a proverb quote as the desktop wallpaper
# Created on30/9/21

imagePath=/home/aldrin/.scripts/assets/biblebg.png
xwallpaper --center $imagePath
# set wallpaper first as generating image will take some time
text="$(biblequote.sh)"
echo -n $text | magick -gravity center -background black -fill white -size 850x500 caption:@- $imagePath


