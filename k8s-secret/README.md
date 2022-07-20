## Pull Docker images from private ECR registry

&nbsp;

> The authorization token is valid for 12 hours. This means that after 12 hours our pull-secret will no longer work, so if you have deployed an application and the scheduler decides to move the pod to another node after 12 hours you will get an `ImagePullBackOff` error as the authentication to ECR no longer works.

&nbsp;

### Prerequisites

+ make sure that the instance that is going to be used to perform the deployment does have `aws-cli` installed and configured with proper `access key id` and `secret access key` so that it has access to pull an image.
+ as a good practice it is always best to deploy different set of applications in separate __namespaces__.

&nbsp;

Besides a familiar look of service and deployment definition, there are a couple of items that are needed to be highlighted:
+ __ERC Image Registry URL__:
    * `<aws_account_id>.dkr.ecr.aws_region.amazonaws.com/<image-name>:<tag>`
    * `<aws_account_id>` - your account id
    * `<aws_region>` - aws region name
    * `<image-name>` - image name
    * `<tag>` - image tag

+ __Image Pull Policy__: `Always` enforce image force pull to avoid unexpected issues when K8s doesn't pull an image from a remote repository.

&nbsp;

### Deployment steps

1. Create namespace via kubectl create command:
```
kubectl create namespace health-check
```
2. In the git repo navigate to the yaml manifest files:
```
cp manifest-ecr-helper-creds-sample.yaml    manifest-ecr-helper-creds.yaml
```
3. Fill out all the required variables in `manifest-ecr-helper-creds.yaml` and then deploy using commands below:
```
kubectl apply -f manifest-ecr-helper-creds.yaml
```

```
kubectl apply -f manifest-ecr-helper.yaml
```

&nbsp;

> The `CronJob` resource is scoped to a specific namespace and is allowed to delete only `regcred` secret which makes it secure.
On the high-level `Secret/ConfigMap` are used to extract configuration details, other resources are used to permit `CronJob` to have the ability to remove/update `regcred` token (`Role` -> `RoleBinding` -> `ServiceAccount` -> `CronJob`)