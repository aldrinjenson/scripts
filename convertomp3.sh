#!/usr/bin/sh
# Script to convert webm to mp3 
# Created on 24/11/22

if [ $# -eq 0 ]; then
 echo "no arguments"
 exit 1
fi 

files=$1
for FILE in $files; do
    echo -e "Processing video '\e[32m$FILE\e[0m'";
    ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
done;
