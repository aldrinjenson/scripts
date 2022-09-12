#!/bin/sh
# Script to convert usd to inr
# created on 29/11/21

factor=77
[[ -z $1 ]] && echo "Enter usd as argument" && exit 0

usd=$1
((inr = usd * factor))
formattedInr=$(printf "%'.3f\n" $inr | cut -d'.' -f1)
echo $usd USD = $formattedInr INR
notify-send "$inr INR" "$usd USD = $formattedInr INR"
