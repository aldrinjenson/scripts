#! /bin/sh
# script to set brightness to the entered percentage
# check man page of brightnessctl to know more 

val=$1 # the argument passed when calling the script

if [ $1 -gt 100 ]
then
	echo "Setting the brightness to 100%"
	brightnessctl s 100% -q
	exit 0
fi

if [ $1 -lt 10 ]
then
	echo "Setting brightness to 10% to avoid going blind"
	brightnessctl s 10% -q
	exit 0
fi

brightnessctl s $1% -q
