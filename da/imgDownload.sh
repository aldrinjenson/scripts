#/usr/bin/sh
# wrapper around python script to batch download tons of images
# created on 23/8/22

python /home/aldrin/.scripts/da/image_download.py $(pwd) $@

length=$(($#-1))
dir=${@:1:$length}
cd $dir
jpgToJpeg.sh
