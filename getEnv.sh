# !/bin/sh
# Script to mimick a hashmap of environment variables
# Created on 6/11/21

key=$1
envFile="$HOME/.scripts/assets/.env"
if [ -z $key ]
then
  echo "No key specified"
  exit 0
fi

grep ^$key $envFile | cut -d"=" -f2-

