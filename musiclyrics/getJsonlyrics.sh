#!/bin/bash
# script to get the timestamped json lyrics of a song using openai whisper
# created on 26/5/23

if [ ! "$1" ];
then
  echo "Song path not passed. exiting"
  exit 1
fi

echo $1

# first convert to wav file using ffmpeg and store in /tmp
# then apply whisper and save the data to Music/json/filename
# then delete the wav file

# whisper --m ~/whisper-experiments/whisper.cpp/models/ggml-base.en.bin --output-json "$1" --output_dir ~/Music/json/ --output_format json --task transcribe


