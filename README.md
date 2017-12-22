[![Build Status](http://54.82.248.248:8080/job/Create_Stack/badge/icon)](http://54.82.248.248:8080/job/Create_Stack/)

# Deployment
IntuitCodingChallange - Deployment Automation

## Technologies/ Services Used:

- Shell Script
- Cloud Formation Templates (JSON Format)
- AWS CloudFormation
- AWS Elastic Load Balancer
- AWS Auto Scaling Groups
- AWS Launch Configurations
- AWS SNS
- AWS IAM
- AWS Route53
- AWS S3
- AWS EC2
- AWS EBS


## Steps to Create a New Stack

- Creating a Test Stack (Creates an ec2-instance from Cloud Formation along with Route53 and deploys the application in the instance)
	
	1. Login to Jenkins @http://54.82.248.248:8080/
	2. Goto job **Create_Test_Stack**, and enter desired Stack Name and the index color for Blue Green Deployments
	3. Click on Build.
	4. If, no errors in log. Check the Cloud Formation for the new stack with the name which you provided to run.

- Creating a Full Stack 
	(Creates ELB, ASG, Launch Config and Route53 DNS entry and one ec2-instance where the application in the instance)
	
	1. Login to Jenkins @http://54.82.248.248:8080/
	2. Goto job **Create_Stack**, and enter desired Stack Name and the index color for Blue Green Deployments
	3. Click on Build.
	4. If, no errors in log. Check the Cloud Formation for the new stack with the name which you provided to run.

