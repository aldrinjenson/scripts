# !/bin/sh
# Script to list and play any movie after selecting it
# Created on 11/10/21

movieFolder='/mnt/D0500E24500E11C0/Movies'

find $movieFolder -regex '.*.\(mp4\|mkv\|avi\)' | cut -d '/' -f1- | dmenu -i -l 20 -p "Choose a movie" | xargs -I "()" mpv "()"



