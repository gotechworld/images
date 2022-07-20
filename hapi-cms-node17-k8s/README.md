## Build node17 Docker image for deploying CMS API in AWS EKS

### Installation steps

1. Grab your [CMS API source code](https://gitlab.altex.ro/ams/hapi-cms) into your root folder.
2. Create a Dockerfile that builds a new `node:17.04-alpine` docker image.
3. Be aware of making use of forcing docker to use linux/amd64 as a platform for macOS.
4. Create a bootstrap file to start running into the docker container.
5. From CLI run the following commands:

```
docker login
```

```
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t hapi-cms-api:0.0.1 . 
```

```
docker image ls
```

```
aws configure
```

```
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 009570627831.dkr.ecr.eu-central-1.amazonaws.com
```

```
docker tag hapi-cms-api:0.0.1 009570627831.dkr.ecr.eu-central-1.amazonaws.com/hapi-cms-api:0.0.1
```

```
docker push 009570627831.dkr.ecr.eu-central-1.amazonaws.com/hapi-cms-api:0.0.1
```

6. Use the new docker image to deploy `hapi-cms-api` helm chart referenced into the `values.yaml` file.