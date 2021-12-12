#! /bin/sh
# Script to convert usd to inr
# created on 29/11/21

factor=75
[[ -z $1 ]] && echo "Enter usd as argument" && exit 0

usd=$1
((inr = usd * factor))
echo $usd USD = $inr INR
notify-send "$inr INR" "$usd USD = $inr INR"
