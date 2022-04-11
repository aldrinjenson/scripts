#!/usr/bin/sh
# Date created: 12-12-21
# Script to start a stopwatch and show it's output based on l option
# options: none to start, <l> to list status, <s> to stop current stopwatch

tempFile=/tmp/stopwatchLog
touch $tempFile

case $1 in
'-s') # for stopping
  notify-send "Stopping stopwatch"
  totalSeconds=$(cut -d 's' -f1 $tempFile)
  min=$((totalSeconds / 60))
  sec=$((totalSeconds % 60))
  msg="$min minutes and $sec seconds."
  echo '0' >$tempFile # clearing the log
  notify-send "$msg"
  echo "$msg"
  killall stopwatch.sh
  ;;
'-l') # for listing current status
  totalSeconds=$(cut -d 's' -f1 $tempFile)
  min=$((totalSeconds / 60))
  sec=$((totalSeconds % 60))
  msg="$min minutes and $sec seconds."
  notify-send "$msg"
  echo "$msg"
  ;;
*)
  notify-send "Stopwatch started."
  for ((i = 0; ; i++)); do
    sleep 1
    seconds=$(cut -d 's' -f1 $tempFile)
    newSeconds=$((seconds + 1))
    echo $newSeconds >$tempFile
  done
  ;;
esac
