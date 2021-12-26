# !/bin/sh
# created on 14/8/21
# script to select an emoji using ctrl+shift+p binding and insert it into the current windo using xdotool
# also have the current emoji copied to clipboard

emojiFile='/home/aldrin/.scripts/assets/emojis.txt'
selected=$(cat $emojiFile | rofi -dmenu -i -matching prefix -l 20)

echo $selected -n | cut -d ' ' -f1 | tr -d '\n' | xclip -selection clipboard
xdotool key "ctrl+v"

notify-send "$selected" "$selected emoji copied to clipboard" -t 1000 --icon=dialog-information
