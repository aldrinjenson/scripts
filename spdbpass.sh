#!/bin/sh
# Script to copy the supabase db password to clipboard and empty the entry from clipboard after 2 seconds
# Created on 28/12/23

token=$(getEnv.sh "SUPABASE_DB_PASSWORD")
clipmanCacheFile="/home/aldrin/.cache/xfce4/clipman/textsrc"
echo $token
echo "$token" | xclip -sel clip && notify-send "Token copied" "Supabase db password copied to clipboard for 2 seconds"
# sleep 5
# sed -i 's/;ghp_\S*;$/;/g' $clipmanCacheFile # To not show the token in clipman
# killall xfce4-clipman && xfce4-clipman &    # Changes will be visible only if clipman is restarted
# echo "ght_token" | xclip -sel clip          # To replace the current keyboard copy buffer
xdotool key "ctrl+shift+v"

