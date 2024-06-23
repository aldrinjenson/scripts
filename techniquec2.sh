#!/bin/bash
# Script to connect to Technique ec2 server 
# Created on 17/2/24

techniqueSshCmd=$(getEnv.sh  techniqueSshCmd)
echo $techniqueSshCmd

# ssh -X -o ServerAliveInterval=600 "$username"@"$url" 
# ssh -X "$(techniqueSshCmd)"
$($techniqueSshCmd)
