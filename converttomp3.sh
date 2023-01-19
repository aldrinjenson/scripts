#!/usr/bin/sh
# Script to convert webm files to mp3 
# Created on 24/11/22


for file in $(ls| grep .webm) do
  ffmpeg -i "${file}" -vn -ab 128k -ar 44100 -y "${file%.webm}.mp3"
done;

