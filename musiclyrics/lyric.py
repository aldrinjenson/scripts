#!/usr/bin/env python3
import time
import dbus
import json
import os

# Constants
DBUS_SERVICE_NAME = 'org.mpris.MediaPlayer2.rhythmbox'
DBUS_OBJECT_PATH = '/org/mpris/MediaPlayer2'
LYRICS_FILE_EXTENSION = '.json'


class CustomLogger:
    def __init__(self, log_file):
        self.log_file = log_file

    def info(self, message):
        timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
        log_message = f'{timestamp} - INFO - {message}'
        if 'Song has ended' in log_message:
            return

        print(log_message)
        with open(self.log_file, 'a') as file:
            file.write(log_message + '\n')

    def error(self, message):
        timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
        log_message = f'{timestamp} - ERROR - {message}'
        print(log_message)
        with open(self.log_file, 'a') as file:
            file.write(log_message + '\n')

logging = CustomLogger('logs.log')

def connect_to_dbus():
    """Connect to the Rhythmbox D-Bus service and return the interface."""
    bus = dbus.SessionBus()
    proxy = bus.get_object(DBUS_SERVICE_NAME, DBUS_OBJECT_PATH)
    return dbus.Interface(proxy, dbus_interface='org.freedesktop.DBus.Properties')

def get_metadata(interface):
    """Retrieve metadata from Rhythmbox."""
    return interface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')

def get_position(interface):
    """Retrieve position from Rhythmbox and convert to seconds."""
    position = interface.Get('org.mpris.MediaPlayer2.Player', 'Position')
    return int(position / 1000000)

def parse_lyrics_file(song_name_without_ext):
    """Parse the lyrics JSON file and return the segments."""
    lyrics_json = {}
    jsonPath = "/home/aldrin/Music/json/"
    try:
        filename = jsonPath + song_name_without_ext
        with open(filename, 'r') as file:
            lyrics_json = file.read()
    except:
        song_name_without_ext = song_name_without_ext.replace('.webm','').strip()
        allFiles = os.listdir(jsonPath)

        matching_files = [file for file in allFiles if song_name_without_ext in file]

        if matching_files:
            currentSongPath = os.path.join(jsonPath, matching_files[0])
            with open(currentSongPath, 'r') as file:
                lyrics_json = file.read()
        else:
            print("Lyrics does not exist")
            os.system('lyrics')
            return {}

    lyrics_data = json.loads(lyrics_json)
    return lyrics_data['segments']

def display_lyrics(segment):
    """Display the lyrics segment, replacing the previously printed line."""
    # Construct the lyric line with a carriage return at the beginning
    lyric_line = f'{segment["text"]}'
    print('\x1b[2K',lyric_line, end='\r')

def main():
    try:
        interface = connect_to_dbus()
    except dbus.exceptions.DBusException:
        logging.error('Failed to connect to the D-Bus service.')
        return

    metadata = get_metadata(interface)
    orig_song_name = metadata['xesam:title']
    song_name_without_ext = orig_song_name.rsplit('.',1)[0]

    print(f"\rPlaying lyrics for {song_name_without_ext}\n")
    try:
        segments = parse_lyrics_file(song_name_without_ext)
    except FileNotFoundError:
        logging.error(f'Lyrics file not found: {orig_song_name}\nTry getting it with whisper')
        return
    except json.JSONDecodeError:
        logging.error(f'Failed to parse lyrics file: {orig_song_name}')
        return

    prev_text = ""
    while True:
        try:
            position_sec = get_position(interface)
            metadata = get_metadata(interface)
            curr_song_name = metadata['xesam:title']
            if curr_song_name != orig_song_name:
                # song ended
                os.system('clear')
                break

            # Check the current timestamp and display corresponding lyrics
            for segment in segments:
                print(type(position_sec))
                if segment['start'] - 0.5 <= position_sec <= segment['end']:
                    curr_text = segment['text']
                    if prev_text != curr_text:
                        display_lyrics(segment)
                        prev_text = curr_text

            # Wait for 1 second
            time.sleep(1)
        except:
            time.sleep(0.5)
    time.sleep(1)
    main() # trying again for the next song

if __name__ == '__main__':
    main()

