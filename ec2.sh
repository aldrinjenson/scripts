# !/bin/sh
# Script to connect to AWS ec2 instance
# Created sometime in july 2020..prolly

instance=$(getEnv.sh ec2Instance)
pemFile=$(getEnv.sh ec2PemFile)

echo -e "Connecting to ec2 instance: $instance\n"
ssh -i $pemFile $instance || echo "Error in connecting."



