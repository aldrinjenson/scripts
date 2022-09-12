# /usr/bin/sh
# script to link all image files to images folder for data analytics
# created on 4/9/22

if [[ ! -d 'images' ]]
then
  echo "images directory does not exist! Check that you are in the right folder"
  exit 1
fi

cd images

allImages=$(find '../' -name *.jpeg)
numFiles=$(ls $allImages | wc -l)
echo "Going to create links for $numFiles in in 3 seconds"
sleep 3
for i in $allImages
do
  ln -s $i .
  if ((c==10))
  then
    exit 0
  fi
done;
