# !/bin/sh
# Script to connect to AWS ec2 instance
# Created too long ago.

instance=$(getEnv.sh "ec2Instance")
echo "Connecting to ec2 instance: $instance\n"
ssh -i ~/personal/ec2Secret.pem $instance || echo "Error in connecting."



