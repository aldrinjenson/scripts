#!/bin/sh
#Script to find other device ips in network
# created on 5/12/22

subnet=$(ip addr | awk '/192/ {print $2}'| head -1 | cut -d '.' -f1,2,3 )

ip="$subnet.0/24" 
echo Device ip = $ip
echo -e "Running nmap in subnet..\n"

echo "Devices connected:"
nmap -sn $ip | grep 192. | cut -d ' ' -f5-

