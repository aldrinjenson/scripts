#!/usr/bin/env python3
import time
import dbus
import json
import logging

# Constants
DBUS_SERVICE_NAME = 'org.mpris.MediaPlayer2.rhythmbox'
DBUS_OBJECT_PATH = '/org/mpris/MediaPlayer2'
LYRICS_FILE_EXTENSION = '.json'

# Configure logging
logging.basicConfig(filename='lyrics.log', level=logging.INFO, format='%(asctime)s - %(message)s')
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(message)s',
    handlers=[
        logging.FileHandler('lyrics.log'),
        logging.StreamHandler()
    ]
)

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

def parse_lyrics_file(filename):
    """Parse the lyrics JSON file and return the segments."""
    with open(filename, 'r') as file:
        lyrics_json = file.read()
    lyrics_data = json.loads(lyrics_json)
    return lyrics_data['segments']

def display_lyrics(segment):
    """Display the lyrics segment, replacing the previously printed line."""
    # Construct the lyric line with a carriage return at the beginning
    lyric_line = f'{segment["text"]}'
    print('\x1b[2K',lyric_line, end='\r')

def main():
    # Connect to D-Bus
    try:
        interface = connect_to_dbus()
    except dbus.exceptions.DBusException:
        logging.error('Failed to connect to the D-Bus service.')
        return

    # Get the song name from the metadata
    metadata = get_metadata(interface)
    song_name = metadata['xesam:title']

    song_ext = song_name.rsplit('.',1)[-1]
    filename = song_name.replace('.'+song_ext, LYRICS_FILE_EXTENSION)
    filename = filename.replace('.webm', '')


    # Construct the filename based on the song name

    # Read and parse the lyrics file
    try:
        segments = parse_lyrics_file(filename)
    except FileNotFoundError:
        logging.error(f'Lyrics file not found: {filename}')
        return
    except json.JSONDecodeError:
        logging.error(f'Failed to parse lyrics file: {filename}')
        return

    # Loop until the song ends
    prev_text = ""
    while True:
        position_sec = get_position(interface)
        metadata = get_metadata(interface)
        curr_song_name = metadata['xesam:title']
        if curr_song_name != song_name:
            print("song changed, switching..")
            break

        # Check the current timestamp and display corresponding lyrics
        for segment in segments:
            if segment['start'] - 1 <= position_sec <= segment['end']:
                curr_text = segment['text']
                if prev_text != curr_text:
                    display_lyrics(segment)
                    prev_text = curr_text

        # Check if the song has ended
        if position_sec >= segments[-1]['end']:
            logging.info('Song has ended.')
            break

        # Wait for 1 second
        time.sleep(1)
    time.sleep(1)
    main() # trying again for the next song

if __name__ == '__main__':
    main()

