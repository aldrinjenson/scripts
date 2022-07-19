# !/bin/sh
# Shell script to get a dmenu prompt and select an entered command from history and get it's output copied to clipboard

cmd=$(history | cut -d' ' -f4- | dmenu -l 15)

echo $cmd | xclip && notify-send "Copied command to clipboard" "$cmd"

