# !/usr/bin/sh
# fuzzy finder for scripts files
# Created on 11/7/22

scriptsPath="/home/aldrin/.scripts"
cd $scriptsPath
find "." -type f -printf '%P\n' | fzf | xargs nvim

