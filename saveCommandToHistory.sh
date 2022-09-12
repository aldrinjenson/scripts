# /usr/bin/sh
# Script to save a particular command to a list for easy access later incase the history gets full
# created on 9/4/22ec2-13-127-41-105.ap-south-1.compute.amazonaws.com

cmd="${@:1}" # take everything from the second word onwards as one argument
if [[ -z $1 ]]
then
  echo "No argument supplied"
  exit 0
fi

savedCommandsFile=$(getEnv.sh savedCommands)
echo $cmd
alreadyExists=$(grep "^$cmd$" $savedCommandsFile)

if [[ -n $alreadyExists ]]
then
  echo "Already exists"
  exit 0
else
  echo $cmd >> $savedCommandsFile && echo "Saved command"
fi

