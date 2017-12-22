#!/bin/bash
StackName=$1
CloudFormationParentTemplateURL=$2
route53index=$3
Region=$4

/usr/bin/aws s3 sync cloudformation/ s3://cloud-formation-templates-001/cloudformation/ --sse

/usr/bin/aws --region $Region cloudformation create-stack \
	--stack-name $StackName \
    --template-url $CloudFormationParentTemplateURL \
    --parameters \
    	      ParameterKey=Index,ParameterValue=$route53index \
    	      ParameterKey=OwnerContact,ParameterValue=likhith3399@gmail.com \

/usr/bin/aws --region $Region cloudformation describe-stacks --stack-name $StackName > status.json
while ! grep -q CREATE_COMPLETE status.json
do
	sleep 30
    /usr/bin/aws --region $Region cloudformation describe-stacks --stack-name $StackName > status.json
	echo "Waiting for Cloud Formation to Complete..."
done