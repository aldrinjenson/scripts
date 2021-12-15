# !/bin/sh
# Script to set a proverb quote as the desktop wallpaper
# Created on30/9/21

imagePath=$(getEnv.sh assets)/biblebg.png
bgImage=~/Pictures/arch-wallpaper.png
xwallpaper --center $imagePath
# set wallpaper first as generating image will take some time

text="$(proverbQuote.sh)"
# echo $text | magick -gravity center -background black -fill white -size 850x500 caption:@- $imagePath && echo "Bg set" || echo "Error in setting bg"
echo $text

convert $bgImage -gravity center -fill white -size 850x500 -pointsize 30 -annotate 0 "$text" $imagePath && echo "Bg set" || echo "Error in setting bg"

# convert -size 500x200 -background white -font arial -fill black -gravity center caption:"This is a title that will be fairly long and I want it to fit nicely" -bordercolor red -border 1 test3.png

