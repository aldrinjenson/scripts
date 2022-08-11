# !/bin/sh
# Script to list and play any movie after selecting it
# Created on 11/10/21

movieFolder=$(getEnv.sh movieFolder)
# player=${1-'mpv'} # pass video player as optional argument
player=${1-'vlc'} # pass video player as optional argument
cd $movieFolder

movie=$(find . -regex '.*.\(mp4\|mkv\|avi\)' |
  cut -d '/' -f2- |
  dmenu -i -l 20 -p "Choose a movie to play")

pgrep $player && killall $player
$player "$movie" || notify-send "Error in playing $movie"
