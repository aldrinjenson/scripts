#!/usr/bin/sh
# Script to counter whatsapp bug
# Created on 20/8/23
#
sh -c 'sleep 0.5; xdotool type "$(xclip -o -selection clipboard)"'
