#!/usr/bin/sh
# script to call an api and save the current local ip
# created on 12/9/22

serverIp=$(getEnv.sh serverIp)
curl $serverIp 

