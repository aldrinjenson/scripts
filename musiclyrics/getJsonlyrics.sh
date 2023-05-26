#!/bin/bash
# script to get the timestamped json lyrics of a song using openai whisper
# created on 26/5/23

unalias whisper
if [ !$1 ];
then
  echo "Song path not passed. exiting"
  exit 1
fi

echo $1

whisper --model base.en "$1" --output_dir ~/Music/json/ --output_format json --task transcribe


