#!/bin/bash
# Script to play a randong song - mostly to be used as an audio alert
# Created on 25/5/23

musicFolder=$(getEnv.sh "musicFolder")
cd $musicFolder
audioFile=$(ls *.mp3 | shuf  | head -1)
echo $audioFile
vlc "$audioFile"
