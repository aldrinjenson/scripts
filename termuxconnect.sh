#!/usr/bin/sh
# script to connect to termux ssh server
# created on 13/9/22

phoneIp=$(getIp.sh)
echo "connecting to $phoneIp"

if [[ $1 == "ssh" ]];
then
  ssh -p 8022 u0a215@$phoneIp
else
sftp -P 8022 u0a215@$phoneIp
fi


