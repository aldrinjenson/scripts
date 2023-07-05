#!/bin/sh
# script to show pomodoro timer status in polybar

logFile=$(getEnv.sh pomodoroLog)

if [ ! -e "$logFile" ]; then
  echo ""
  exit 0
fi

timeLeft=$(sed 1q $logFile)

if ((timeLeft == -1))
then
  echo ""
else
  echo "$timeLeft minutes left"
fi

