#/usr/bin/sh
# wrapper around python script to batch download tons of images
# created on 23/8/22

length=$(($#-1))
dir=${@:1:$length}
python /home/aldrin/.scripts/da/image_download.py $(pwd) $@ 
# && cd $dir && jpgToJpeg.sh
