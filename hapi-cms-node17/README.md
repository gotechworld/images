## Build - Tag - Push Docker images using Jenkins pipeline into Amazon ECR

`Amazon ECR` uses `Amazon S3` for storage to make our container images highly available and accessible, allowing us to reliably deploy new containers for our applications.
`Amazon ECR` transfers our container images over HTTPS and automatically encrypts our images at rest.
`Amazon ECR` is integrated with `Amazon Elastic Container Service (ECS)`, simplifying our development to production workflow.
 
&nbsp;

### Pre-requisites

+ `Jenkins Controller` and `Jenkins agent` are up and running
+ Docker installed on `Jenkins agent`
+ Docker and Docker pipelines plug-in's are installed on `Jenkins Controller`
+ AWS CLI is installed on `Jenkins agent`
+ Access to `Amazon ECR` to create repo's and push the Docker images

&nbsp; 

### How to use the pipeline code

+ `AWS_ACCOUNT_ID` paste your AWS Account ID
+ `AWS_DEFAULT_REGION` copy created ECR repo region id
+ `IMAGE_REPO_NAME` set your ECR repository name
+ `IMAGE_TAG` mention your desired tag

&nbsp; 

### Resources

[CloudBees AWS Credentials](https://plugins.jenkins.io/aws-credentials/)
[Docker](https://plugins.jenkins.io/docker-plugin/)