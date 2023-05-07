#!/bin/sh
# Script to push the dotfiles and scripts to git 5 seconds after reboot
# Created on 17/12/22

sleep 5m

cd ~/.dotfiles
(git add -A && git commit -m "Updates") && notify-send "Committing to git" || (echo "Nothing left to commit." )
git push && notify-send "Pushing files to git" 

cd ~/.scripts
(git add -A && git commit -m "Updates") && notify-send "Committing scripts git" || (echo "Nothing left to commit." )
git push && notify-send "Pushing files to git" 


