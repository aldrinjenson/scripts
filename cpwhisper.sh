#!/bin/bash
# Script to use whisper.cpp for awesome transcribings
# Created on 13/6/23


song="$1"

if [[ -z "$song" ]]; then
  echo "Audio file not provided. Exiting..."
  exit 1
fi

whisper_path="/home/aldrin/whisper-experiments/whisper.cpp"
model="ggml-base.en.bin"
tmp_song_name="/tmp/$song.wav"


song_name=$(basename "$song")
song_name_without_extension="${song_name%.*}"


json_folder="/home/aldrin/Music/json"
if [ -n "$2" ]; then
  json_folder="$2"
fi

json_file_name="${json_folder}/${song_name_without_extension}"
echo $json_folder
echo $json_file_name


final_song_name=$song

# Check if the audio file has a .wav extension
if [[ "${song_name##*.}" != "wav" ]]; then
  echo "Converting to WAV format"
  final_song_name="/tmp/$song_name_without_extension.wav"
  ffmpeg -i "$song" -ar 16000 -ac 1 -c:a pcm_s16le "$final_song_name"
fi

cd "$whisper_path"
echo "Transcribing $song"
./main -m "models/$model" --output-json -f "$final_song_name"  --output-file "$json_file_name"
# echo "Transcription done. JSON file saved in $json_file_name"
# rm "/tmp/$song_name_without_extension.wav"
# rm "$final_song_name"


