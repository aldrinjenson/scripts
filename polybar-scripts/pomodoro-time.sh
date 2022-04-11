#!/bin/sh
# script to show pomodoro timer status in polybar

logFile=$(getEnv.sh pomodoroLog)
timeLeft=$(sed 1q $logFile)

if ((timeLeft == -1))
then
  echo ""
else
  echo "$timeLeft minutes left"
fi

