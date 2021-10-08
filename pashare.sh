# !/bin/sh

PORT=8000
SERVER=192.168.237.89
case "$1" in
  start)
    $0 stop 
     pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor record=true port=$PORT listen=$SERVER
     echo "Audio stream started; Server:$SERVER  ;Port:$PORT"
    ;;
  stop)
    pactl unload-module `pactl list | grep tcp -B1 | grep M | sed 's/[^0-9]//g'`
    echo "Audio strea stopped"
    ;;
  *)
    echo "Usage: $0 start|stop" >&2
    ;;
esac
