#!/bin/sh
# Created on 8/8/21
# Script to choose a random wallpaper and set it at startup. Will be called in .xprofile to run at startup irrespective of DE or WM

wallpapersFolder='/home/aldrin/.config/wallpapers'

bg=$(ls "$wallpapersFolder" | shuf --head-count=1 ) 
bgPath="$wallpapersFolder/$bg"
xwallpaper --zoom "$bgPath"
