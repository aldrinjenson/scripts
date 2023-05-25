import subprocess
import urllib.parse

# List of song names
song_names = [
    "Alan Walker & Ava Max - Alone, Pt. II (Lyrics)",
    "Alec Benjamin - Let Me Down Slowly (Lyrics)",
    "Alessia Cara - Scars To Your Beautiful (Lyrics)",
    # Add more song names as needed
]

# Iterate over the song names and download the audio using youtube-dl
for song_name in song_names:
    # Encode the song name for the search query
    search_query = f"{song_name} audio"
    encoded_query = urllib.parse.quote(search_query)

    # Search for the song on YouTube and get the video URL
    command = ['youtube-dl', '-e', '--get-id', '--get-url', f"ytsearch1:{encoded_query}"]
    output = subprocess.check_output(command).decode('utf-8').splitlines()

    # Extract the video URL and video ID
    video_url = output[1]
    video_id = output[2]

    # Download the audio from the video as an MP3 file
    output_file = f"{song_name}.mp3"
    command = ['youtube-dl', '-x', '--audio-format', 'mp3', '-o', output_file, video_url]
    subprocess.run(command)

    print(f"Downloaded: {song_name}")

print("All songs downloaded.")

