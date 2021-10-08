# !/bin/sh
# Script to copy the github token to clipboard
# Created on 18/9/21

token="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"
echo $token | xclip -sel clip && notify-send "Token copied" "Github access token copied to clipboard"




