#!/usr/bin/sh
# Created on 17/8/22
# script to remove wifi module and add it back again

sudo rmmod iwlmvm iwlmei iwlwifi
modprobe iwlmei
modprobe iwlmvm
modprobe iwlwifi

nokiaWifiConnect.sh
