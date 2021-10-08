# !/bin/sh
# Script to show a random word from dictionary with it's meaning. Can also pass meaning as second argument to save it to dictionary
# Created on 8/10/21

word=$1
meaning=$2
dictFile='/home/aldrin/.scripts/assets/wordDict.txt'
programName="meaningWord.sh"

if [[ -z $1 && -z $2 ]];
then
  shuf $dictFile -n 1
  # show a word meaning when no params are passed
  exit 0
fi;

if [[ $1 == '-h' ]];
then
  echo -e "- Enter '$programName' <word> to get the word meaning from saved dictionary\n- Enter '$programName' <word> <meaning> to add new word to saved dictFile\n- Enter '$programName' to list out one random word and it's meaning from saved dictionary"
  exit 0
fi

if [[ -z $2 ]];
then
  grep --color="auto" --ignore-case "^$1" $dictFile
  # show the meaning of word passed as first argument
  exit 0;
fi;


echo $1: ${@:2} >> $dictFile && echo "New word '$1' and it's meaning '${@:2}' added to dictionary"

