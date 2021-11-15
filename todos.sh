# !/bin/sh
# Script to set todos as wallpaper
# Created on  11/11/21

imagePath=/home/aldrin/.scripts/assets/todoWall.png
todoFile=/home/aldrin/.scripts/assets/todos.txt
xwallpaper --center $imagePath && notify-send "Bg set" || notify-send "Error" "Error in setting background"

cat $todoFile | magick -gravity center -background black -fill white -size 850x500 caption:@- $imagePath




