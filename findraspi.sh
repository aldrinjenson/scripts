#!/bin/bash
# script to find the raspberry pi in the network and connect to it using ssh
# Created on 19/1/23

myIp=$(ip addr | awk '/192./ {print $2}' | cut -d'/' -f1- | head -1)
echo "Current Ip = $myIp"

[ -z "$currentIp" ] && echo -e "Not connected to a network\nExiting.." && exit 1

subnet=$(echo $myIp | cut -d '.' -f1-3).0/24
echo "Subnet = $subnet"

echo "Scanning Available Ips in the subnet having ssh open..."
availableIps=$(nmap -p 22 --open -sV $subnet | grep 192 | cut -d ' ' -f 5)
echo $availableIps

[ -z "$availableIps" ] && echo -e "No server listening for ssh. Exiting..." && exit 0

echo -e "\nTrying the very first match...\n"

raspiIp=$(echo $availableIps | head -1)
echo "Probabl raspberry pi Ip = $raspiIp"
echo -e "Connecting with ssh...\n\n\n"

# based on ssh key
ssh "hank@$raspiIp" 
