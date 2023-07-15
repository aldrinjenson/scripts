#!/bin/bash

echo $@

case $@ in 
  w)
    echo 'w bro'
    ;;
  p)
    echo 'play bro'
    ;;
esac

while getopts "w:p:" opt; do
  case ${opt} in
    w)  # Specify work duration
      echo "w bro"
      ;;
    p)  # Specify play duration
      echo "p"
      ;;
    \?) # Invalid option
      echo "Invalid option: -$OPTARG"
      exit 1
      ;;
  esac
done
