## Create and mount a secret in an Amazon EKS pod

1. ### Create [Secret](https://eu-central-1.console.aws.amazon.com/secretsmanager/home?region=eu-central-1#!/secret?name=prod%2Fservice%2Ftoken) in AWS Secrets Manager
    + Select `Other type of secrets`
    + Create key: `MY_API_TOKEN` and random value: `<[}sYNKL25/_X^*R`
    + Give it a name `prod/service/token`
    + Open created secret to check ARN

&nbsp;

2. ### Create IAM OIDC Provider for EKS
    + Copy `OpenID Connect provider URL`
    + Create Identity Provider - select `OpenID Connect`
    + Enter `sts.amazonaws.com` for Audience

&nbsp;

3. ### Create IAM Policy to Read Secrets
    + Create `APITokenReadAccess` IAM policy
    ```
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "secretsmanager:GetRandomPassword",
                    "secretsmanager:GetResourcePolicy",
                    "secretsmanager:GetSecretValue",
                    "secretsmanager:DescribeSecret",
                    "secretsmanager:ListSecretVersionIds"
                ],
                "Resource": "arn:aws:secretsmanager:eu-central-1:009570627831:secret:prod/service/token-ifPJVl"
            }
        ]
    } 
    ```

&nbsp;

4.  ### Create IAM Role for a K8s Service Account
    + Click `Web identity` and select Identity provider that we created
    + Select `APITokenReadAccess` IAM Policy
    + Give it a name `api-token-access`
    + Update trust relationships on the role
    + Update `aud` -> `sub`
    + Update `sts.amazonaws.com` -> `system:serviceaccount:production:nginx`

&nbsp;

5. ### Associate an IAM Role with K8s Service Account
    + Create `nginx/namespace.yaml`
    + Create `nginx/service-account.yaml`
    + Apply k8s objects
    ```
    alias k="kubectl"
    k apply -f nginx
    ```
    + Get K8s namespaces
    ```
    k get ns
    ```
    + Describe service account
    ```
    k get sa -n production
    ```
&nbsp;

6. ### Install the K8s Secrets Store CSI Driver
    + Create `secrets-store-csi-driver/0-secretproviderclasses-crd.yaml`
    + Create `secrets-store-csi-driver/1-secretproviderclasspodstatuses-crd.yaml`
    + Apply CRDs
    ```
    k apply -f secrets-store-csi-driver
    ```
    + Create `secrets-store-csi-driver/2-service-account.yaml`
    + Create `secrets-store-csi-driver/3-cluster-role.yaml`
    + Create `secrets-store-csi-driver/4-cluster-role-binding.yaml`
    + Create `secrets-store-csi-driver/5-daemonset.yaml`
    + Create `secrets-store-csi-driver/6-csi-driver.yaml`
    + Apply K8s objects
    ```
    k apply -f secrets-store-csi-driver
    ```
    + Check the logs
    ```
    k logs -n kube-system -f -l app=secrets-store-csi-driver
    ```
&nbsp;

7. ### Install AWS Secrets & Configuration Provider (ASCP)
    + Create `aws-provider-installer/0-service-account.yaml`
    + Create `aws-provider-installer/1-cluster-role.yaml`
    + Create `aws-provider-installer/2-cluster-role-binding.yaml`
    + Create `aws-provider-installer/3-daemonset.yaml`
    + Apply aws-provider-installer
    ```
    k apply -f aws-provider-installer
    ```
    + Check logs
    ```
    k logs -n kube-system -f -l app=csi-secrets-store-provider-aws
    ```
&nbsp;

8. ### Create Secret Provider Class
    + Create `nginx/2-secret-provider-class.yaml`
    ```
    k apply -f nginx
    ```
&nbsp;

9. ### Demo
    + Create nginx `3-deployment.yaml`
    + Open 2 tabs
    ```
    k logs -n kube-system -f -l app=secrets-store-csi-driver
    ```
    ```
    k apply -f nginx
    ```
    ```
    k -n production exec -it nginx-<id> -- bash
    ```
    + Print mounted file
    ```
    cat /mnt/api-token/secret-token
    ```
    + Print environment variables with a secret
    ```
    echo $API_TOKEN
    ```
&nbsp;

10. ### Links

+ [secrets-store-csi-driver](https://github.com/kubernetes-sigs/secrets-store-csi-driver)
+ [AWS Secrets & Configuration Provider (ASCP)](https://github.com/aws/secrets-store-csi-driver-provider-aws)
+ [Using Secrets Manager secrets in Amazon Elastic Kubernetes Service](https://docs.aws.amazon.com/secretsmanager/latest/userguide/integrating_csi_driver.html)
+ [How to use AWS Secrets & Configuration Provider with your Kubernetess Secrets Store CSI Driver](https://aws.amazon.com/blogs/security/how-to-use-aws-secrets-configuration-provider-with-kubernetes-secrets-store-csi-driver/)
+ [IAM role configuration](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts-technical-overview.html)



