#!/usr/bin/env python3
import time
import dbus
import json

# Connect to the Rhythmbox D-Bus service
bus = dbus.SessionBus()
proxy = bus.get_object('org.mpris.MediaPlayer2.rhythmbox', '/org/mpris/MediaPlayer2')
interface = dbus.Interface(proxy, dbus_interface='org.freedesktop.DBus.Properties')

# Get the metadata and position from Rhythmbox
metadata = interface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
position = interface.Get('org.mpris.MediaPlayer2.Player', 'Position')

# Convert the position from microseconds to seconds
position_sec = int(position / 1000000)

# Get the song name from the metadata
song_name = metadata['xesam:title']

# Construct the filename based on the song name
filename = song_name.replace('.mp3', '.json')

print(song_name)
# Read the lyrics JSON from the file
with open(filename, 'r') as file:
    lyrics_json = file.read()

# Parse the lyrics JSON
lyrics_data = json.loads(lyrics_json)

# Get the segments from the lyrics data
segments = lyrics_data['segments']

# Loop until the song ends
prevText=""
while position_sec < segments[-1]['end']:
    # Check the current timestamp and display corresponding lyrics
    for segment in segments:
        if segment['start'] -1 <= position_sec <= segment['end']:
            currText = segment['text']
            if prevText != currText:
                print(currText)
                prevText = currText
    
    # Wait for 1 second
    time.sleep(1)
    
    # Update the position from Rhythmbox
    position = interface.Get('org.mpris.MediaPlayer2.Player', 'Position')
    position_sec = int(position / 1000000)

# Song has ended, exit the loop
print("Song has ended.")

