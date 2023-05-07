#!/bin/bash
# Script to connect to MEC GPU server for final year project related works
# Created on 28/2/22

url=$(getEnv.sh mecGpuUrl)
username=$(getEnv.sh mecGpuUsername)
pwd=$(getEnv.sh mecGpuPwd)

ssh -X -o ServerAliveInterval=600 "$username"@"$url" 
