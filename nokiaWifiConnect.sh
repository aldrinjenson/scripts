# !/bin/sh
# Script to connect to wifi in my nokia 8.1 phone easily
# updated on 2/10/21

nmcli dev wifi rescan && sleep 1 && nmcli device wifi connect E2:64:AA:5A:0A:4A password 987654321 && notify-send "Connected" "Connected to Nokia 8.1" || notify-send "Error in connecting to wifi"


