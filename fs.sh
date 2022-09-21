# !/usr/bin/sh
# fuzzy finder for scripts files
# Created on 11/7/22

scriptsPath=$(getEnv.sh scriptsPath)
cd $scriptsPath
find "." -type f -printf '%P\n' | fzf | xargs lvim

