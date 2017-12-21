#Parameters
StackName=$1
Region=$2
CloudFormationTemplateURL=$3
route53index=$4

/usr/bin/aws s3 cp cloudformation/ec2_cloudformation.json s3://cloud-formation-templates-001/cloudformation/ --sse
/usr/bin/aws --region $Region cloudformation create-stack \
	--stack-name $StackName \
    --template-url $CloudFormationTemplateURL \
    --parameters \
    	      ParameterKey=Index,ParameterValue=${route53index} \
    	      ParameterKey=OwnerContact,ParameterValue=likhith3399@gmail.com \

/usr/bin/aws --region $Region cloudformation describe-stacks --stack-name $StackName > status.json
while ! grep -q CREATE_COMPLETE status.json
do
	sleep 10
    /usr/bin/aws --region $Region cloudformation describe-stacks --stack-name $StackName > status.json
	echo "Waiting for Cloud Formation to Complete..."
done