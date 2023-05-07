#!/bin/bash
# Script to copy the contents of a file to system cllipboard
# Created on 20/2/22

cat "$1" | xclip -selection clipboard
