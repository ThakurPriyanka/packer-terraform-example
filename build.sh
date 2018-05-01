#!/usr/bin/env bash
echo "*** Deployment started"
usage() {
  echo "(AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) to be set"
  exit 1
}

if [ ${#} -ne 2 ]; then
  usage
fi
ACCESS_KEY=$1 
SECRET_KEY=$2 

export SSH_KEY_NAME
SSH_KEY_NAME="mykey"
export IMAGE_NAME
IMAGE_NAME="ubuntu-dockers"
sed -i -e "s/ami_image_name/${IMAGE_NAME}/g" terraform/vars.tf
echo "***  starting packer"
sh packer.sh $ACCESS_KEY $SECRET_KEY;

echo "***  starting terraform" 
sh terraform.sh; 
sed -i -e "s/${IMAGE_NAME}/ami_image_name/g" terraform/vars.tf
echo "*** Deployment complete"


