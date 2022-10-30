#!/usr/bin/sh
# Script to create a folder structure of files for a p5 project with autocompletion
# Created on 27/10/22

if [ $# -eq 0 ]; then
 echo -e "Pass project name as argument and try agian\nExiting.."
 exit 1
fi

projectName=$1
p5template='/home/aldrin/code/resources/P5JS_PROJECT_TEMPLATE/'

mkdir $projectName && cp $p5template/* $projectName -r || echo "Error!"
echo "$projectName Project created"
echo "Try cd $projectName and open with code editor" 
