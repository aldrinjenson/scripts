#!/usr/bin/sh
# script to call an api and save the current local ip
# created on 12/9/22

serverIp=$(getEnv.sh serverIp)
ip=$(ip -json a | jq | grep 192 | grep local | head -1 | cut -d'"' -f4)

curl $serverIp -d '{"ip":"'$ip'"}' -H "Content-Type: application/json"
