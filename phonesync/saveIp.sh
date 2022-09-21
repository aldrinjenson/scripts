#!/usr/bin/sh
# script to call an api and save the current local ip
# created on 12/9/22

serverIp=$(getEnv.sh serverIp)
ip=$(ip -json a | jq | grep 192 | grep local | head -1 | cut -d'"' -f4)
# ip=$(ip addr | awk '/inet\s/ {print $2}' | cut -d'/' -f1 | head -1)
echo $ip

curl $serverIp -d '{"ip":"'$ip'"}' -H "Content-Type: application/json"
