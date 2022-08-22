#/usr/bin/sh
# created on 22/8/22
# script to add a subscript name to all files; useful for deeplearning training data

if [[ $# -eq 0 ]] ; then
  echo 'usage: scriptName subscript'
  echo 'exiting due to lack of subscript'
  exit 0
fi

subscript=$1
for file in *; do mv $file $1-$file; done;
  ls
