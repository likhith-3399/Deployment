#!/bin/bash
StackName=$1
Region=$2
CloudFormationTemplateURL=$3

var/lib/jenkins/aws-cli/bin/aws s3 cp cloudformation/ec2_cloudformation.json s3://cloud-formation-templates-001/ec2_cft/ --sse
/var/lib/jenkins/aws-cli/bin/aws cloudformation create-stack --stack-name $StackName --region $Region --template-url $CloudFormationTemplateURL

/var/lib/jenkins/aws-cli/bin/aws cloudformation describe-stacks --stack-name $StackName > status.json
while ! grep -q CREATE_COMPLETE status.json
do
	sleep 10
    /var/lib/jenkins/aws-cli/bin/aws cloudformation describe-stacks --stack-name $StackName > status.json
	echo "Waiting for Cloud Formation to Complete..."
done
