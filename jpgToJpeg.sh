#!/usr/bin/sh
# Created on 22/8/22
# script to convert all jpeg files to jpg and remove all jpg files

echo "No. of jpg files = $(ls -l | wc -l)"

mogrify -auto-orient -format jpeg *.jpg && rm *.jpg && echo "Converted all jpg files" && ls | wc -l || echo "Error in conversion"


