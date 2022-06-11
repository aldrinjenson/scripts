# !/usr/bin/sh
# script to take the current ip address and show a qr cade based on it so that it can be instantly copied to android
whatismyip.sh | tail -1 | head | cut -d'/' -f1-1 | xargs -I "()" echo "http://()" | qrencode -o /tmp/ip-qr.png && sxiv /tmp/ip-qr.png
