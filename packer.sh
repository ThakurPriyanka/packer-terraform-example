#!/usr/bin/env bash
set -e

usage() {
  echo "environment variable AWS_PROFILE or access keys (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) to be set"
  exit 1
}

if [ ${#} -ne 2 ]; then
  usage
fi

AWS_ACCESS_KEY=$1  
AWS_SECRET_KEY=$2 



run_packer() {
  set -x
echo "enter into run packer"
  packer build \
 -var aws_access_key=$1 \
 -var aws_secret_key=$2\
 packer/demo-packer.json
  set +x
}

run_packer $AWS_ACCESS_KEY $AWS_SECRET_KEY
