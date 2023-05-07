#!/usr/bin/sh
# Script to convert webm files to mp3 
# Created on 24/11/22

musicFile=$1
echo $musicFile
if [ musicFile ] ; 
then
  ffmpeg  -i "${musicFile}" -vn -ab 128k -ar 44100 -y "${musicFile}.mp3" && echo "Converted to mp3"
  exit 0
fi

for file in $(ls | grep .webm); do
  echo "Processing file $file\n"
  ffmpeg  -i "${file}" -vn -ab 128k -ar 44100 -y "${file%.webm}.mp3"
done;

