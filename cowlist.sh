#! /bin/sh
# Created on 15/8/21
# Simple program to generate all cowsay art

fileName="/home/aldrin/.scripts/assets/cows.txt"
list=$(cat $fileName)

for cow in $list; do
  cowsay -f "$cow" "$cow"
done
