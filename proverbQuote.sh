#! /bin/sh
# Script to generate a random proverbQuote from the Bible
# Created on 23-11-21

# kjv -W proverbs | shuf -n 1  # a bit slow

assetPath=/home/aldrin/.scripts/assets
node ${assetPath}/proverb.js

