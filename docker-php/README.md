# Docker-PHP

## 🤔 How to use it 

For available commands run:
```shell
Usage:
  make [target] [arg="val"...]

Targets:
  build-72        Build PHP 7.2 images
  build-73        Build PHP 7.3 images
  build-74        Build PHP 7.4 images
  build-80        Build PHP 8.0 images
  build-81        Build PHP 8.1 images
  build-all       Build all images
  build-and-push-72 Build and push PHP 7.2 images to Docker Hub
  build-and-push-73 Build and push PHP 7.3 images to Docker Hub
  build-and-push-74 Build and push PHP 7.4 images to Docker Hub
  build-and-push-80 Build and push PHP 8.0 images to Docker Hub
  build-and-push-81 Build and push PHP 8.1 images to Docker Hub
  build-and-push  Build all images and push them to Docker Hub
  build           Build image. Usage: make build TAG="7.0-cli"
  clean           Clean all containers and images on the system
  push-72         Push built PHP 7.2 images to Docker Hub
  push-73         Push built PHP 7.3 images to Docker Hub
  push-74         Push built PHP 7.4 images to Docker Hub
  push-80         Push built PHP 8.0 images to Docker Hub
  push-81         Push built PHP 8.1 images to Docker Hub
  push-all        Push all built images to Docker Hub
  test            Run all tests; Usage: make test [t="<test-folder-1> <test-folder-2> ..."]
```
