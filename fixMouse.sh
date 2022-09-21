#!/usr/bin/sh
# Created on 17/8/22
# script to remove mouse module and add it back again

modprobe --remove psmouse && echo "Removed mouse module" || ( echo "Error in removing mouse module" && exit 1 )
modprobe psmouse && echo "Added mouse module" || echo "Error in adding mouse"

