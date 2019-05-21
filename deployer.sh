# !/usr/bin/env bash

BUCKET_NAME="cs-cfn-nested-bucket"
STACK_NAME="cs-assignment-stack"

# if [[ $1 != "" ]]; then
#   $BUCKET_NAME=$1
# else
#   echo "Bucket Name is Blank"
#   exit 0
# fi
#
# if [[ $2 != "" ]]; then
#   $STACK_NAME=$2
# else
#   echo "Stack Name is Blank"
#   exit 0
# fi
#
# if [[ $3 != "" ]]; then
#   PROFILE_CHECK=$([[ $(aws configure --profile $3 list) && $? -eq 0 ]] && echo 1 || echo 0)
# else
#   PROFILE_CHECK=0
# fi
#
# if [[ $PROFILE_CHECK == 1 ]]; then
#   export AWS_DEFAULT_PROFILE=$3
# else
#   export AWS_DEFAULT_PROFILE="default"
# fi

AZs=($(aws ec2 describe-availability-zones --output json | jq -r '.AvailabilityZones[].ZoneName'))

aws cloudformation package \
  --template-file templates/master.yaml \
  --output-template-file temp-template.template \
  --s3-bucket $BUCKET_NAME

aws cloudformation deploy \
  --template-file temp-template.template \
  --stack-name $STACK_NAME \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
  AvailabilityZones="${AZs[0]},${AZs[1]}" \
  DatabaseName=testdb \
  DatabaseMasterPassword="jyPLBzDC30" \
  EC2KeyName="EC2-Ireland" \
  DatabaseMasterUsername="masteruser"

# Clean Up
rm -f temp-template.template
