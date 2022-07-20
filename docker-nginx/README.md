# Docker-NGINX

## 🤔 How to use it 

For available commands run:
```shell
Usage:
  make [target] [arg="val"...]

Targets:
  build-all       Build all images
  build-and-push-alpine-nginx Build and push PHP 7.2 images to Docker Hub
  build-and-push  Build all images and push them to Docker Hub
  build           Build image. Usage: make build TAG="nginx"
  clean           Clean all containers and images on the system
  push-all        Push all built images to Docker Hub
  push-alpine-nginx Push built PHP 7.2 images to Docker Hub
```