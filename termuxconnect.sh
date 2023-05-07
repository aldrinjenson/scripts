#!/usr/bin/sh
# script to connect to termux ssh server
# created on 13/9/22

# phoneIp=$(getIp.sh)
phoneIp=192.168.154.96
echo "connecting to $phoneIp"

if [[ $1 == "ssh" ]];
then
  echo 'ssh -p 8022 u0a215@"$phoneIp"'
  ssh -p 8022 u0a215@"$phoneIp"
else
sftp -P 8022 u0a215@$phoneIp
fi


