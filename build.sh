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


echo "***  starting packer"
sh packer.sh $ACCESS_KEY $SECRET_KEY;

echo "***  starting terraform"
sh terraform.sh; 
echo "*** Deployment complete"


