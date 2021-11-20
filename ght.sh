# !/bin/sh
# Script to copy the github token to clipboard and empty the entry from clipboard after 2 seconds
# Created on 18/9/21
# Major update on 10/10/21

token=$(getEnv.sh "ghtToken")
clipmanCacheFile="/home/aldrin/.cache/xfce4/clipman/textsrc"
echo $token | xclip -sel clip && notify-send "Token copied" "Github access token copied to clipboard for 2 seconds"
sleep 2
sed -i 's/;ghp_\S*;$/;/g' $clipmanCacheFile # To not show the token in clipman
killall xfce4-clipman && xfce4-clipman &    # Changes will be visible only if clipman is restarted
echo "ght_token" | xclip -sel clip          # To replace the current keyboard copy buffer







