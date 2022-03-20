#!/usr/bin/sh
echo "Hi there"

echo "What do you want me to do sir?"
read -r instruction

bash -c "$instruction"
