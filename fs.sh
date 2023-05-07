# !/usr/bin/sh
# fuzzy finder for scripts files
# Created on 11/7/22

scriptsPath=$(getEnv.sh scriptsPath)
cd $scriptsPath

chosenScript=$(find "." -type f -not -path '*/node_modules/*' -printf '%P\n' | grep -v .git | fzf )

if [ -z "$chosenScript" ]; then
  echo "No script selected; exiting";
  exit 0
fi

lvim $chosenScript
# xargs lvim

