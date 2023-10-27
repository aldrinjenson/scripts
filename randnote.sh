#!/usr/bin/sh
# Script to create a random note and have it be saved in the misc directory which can then later be read using obsidian
# Created on 27/10/23 while in Indigo Flight:)

miscFolder="~/personal/vault/random"
filename=$1
echo $filename
echo $miscFolder

filepath="$miscFolder/$filename"

echo -e "---Created on $(date)\n---" >> "$filepath"



