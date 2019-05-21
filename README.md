![Architecture Diagram](/Users/aamirji/Code-Snipps/CS-Assignment-Templates/CS-Assignment-Arch-Diagram.png)



#### Service Explanation

##### IAM

##### VPC (Virtual Private Cloud)

##### Elastic Load Balancer

##### Auto-Scaling

##### RDS (Relational Database Service)

##### CloudWatch

Monitoring for the ELB/EC2 and RDS Instaces



------

#### Templates Overview

To make the setup re-useable and easy to manage, CloudFormation and nested stacks have been created.

The Templates are a logical grouping of services.

**master.yaml**

**1-vpc.yaml**



(*) Scope limits mentioned at the end

------

#### How to Deploy

```bash
./deployer.sh <bucket-name> <stack-name> [aws-default-profile] [aws-region]
```

**bucket-name** - AWS Bucket where the templates would be uploaded (Standard S3 Bucket naming rules apply).

**stack-name** name for the cloudformation stack.

**aws-default-profile** (optional) - The CLI profile to be chosen when doing deployments. If nothing is entered, the default profile is chosen

**aws-region** (optional) - The region where the deployment would be made (Expected input. The AWS Region codes eg "us-east-1" region map below, if nothing is entered default region would be us-east-1)

| Region Name (Human Readable) | Region Code |
| ---------------------------- | ----------- |
|US East (Ohio)| us-east-2|
|US East (N. Virginia)|us-east-1|
|US West (N. California)|	us-west-1|
|US West (Oregon)|	us-west-2|
|Asia Pacific (Mumbai)|	ap-south-1|
|Asia Pacific (Seoul)|	ap-northeast-2|
|Asia Pacific (Singapore)|	ap-southeast-1|
|Asia Pacific (Sydney)|	ap-southeast-2|
|Asia Pacific (Tokyo)|	ap-northeast-1|
|Canada (Central)|	ca-central-1|
|EU (Frankfurt)|	eu-central-1|
|EU (Ireland)|	eu-west-1|
|EU (London)|	eu-west-2|
|EU (Paris)|	eu-west-3|
|EU (Stockholm)|	eu-north-1|
|South America (São Paulo)|	sa-east-1|

------

#### Wanted to implement

- Validations in the ```./deployer.sh``` bash script (for bucket name/profile check/region check)
- Route53 for custom DNS implementations.
- SSM Instance Association (SSH access using IAM from the AWS Console)
- Store RDS URI/Username in SSM Parameter store and Password as Secure String (Encrypted Strings using KMS)
- RDS Access to code on EC2 via IAM Roles
