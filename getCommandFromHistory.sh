# /usr/bin/sh
# Script to get a particular command from saved list using fzf
# created on 9/4/22

savedCommandsFile=$(getEnv.sh savedCommands)
cat $savedCommandsFile | fzf
# cmd=$(cat $savedCommandsFile | fzf)
# echo $cmd | xclip -sel clip && notify-send "Copied $cmd to clipboard"
# xdotool type $cmd
