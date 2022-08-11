#!/bin/sh
# Script to list and play any song I have after selecting it from dmenu
# Created on 22/10/21

musicFolder=$(getEnv.sh musicFolder)
# player=${1-'mpv'}   # pass music player as optional argument
player=${1-'rhythmbox'}   # pass music player as optional argument
cd "$musicFolder" || exit

musicRegex=".*.\(mp3\|ogg\|opus\|webm\|m4a\)"

song=$(find . -regex $musicRegex |
  cut -d '/' -f2- |
  dmenu -i -l 20 -p "Choose a song to play")

pgrep "$player" && killall "$player"
$player "$song" || notify-send "Error in playing $song"

# pashare.sh & xargs -I "()" mpv "()"
