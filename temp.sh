# !/bin/sh
# Script to
# Created on 


echo hi
echo -e "hi\nhi"
echo -e "hi\r"
echo -e "ho" $'\r'
echo -e "ho0" $'\r'
v=5
echo -n "$v %" $'\r'
sleep 2
((v++))
echo $v
echo -n "$v %" $'\r'


