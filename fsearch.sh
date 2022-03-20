#! /bin/sh

cat << doc
A custom fuzzy search for files using dmenu, made by me Lol
doc

#echo -n "Enter file path: "
#read filePath

filePath=$1

ls "$filePath" | dmenu -l 20 -i | xargs xdg-open


