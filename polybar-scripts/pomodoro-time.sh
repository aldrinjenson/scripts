#!/bin/sh
# script to show pomodoro timer status in polybar

logFile=$(getEnv.sh pomodoroLog)
timeLeft=$(cat $logFile)

if ((timeLeft == -1))
then
  exit 0
else
  echo  $timeLeft minutes left
fi

