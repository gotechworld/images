.RECIPEPREFIX := $(.RECIPEPREFIX) 
.DEFAULT_GOAL := help
.PHONY: *

PREFIX = axsys.ro
IMAGE = nginx

help:
  @echo "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m"
  @grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build image. Usage: make build TAG="1.21.6-alpine"
  @docker build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t $(PREFIX)/$(IMAGE):$(TAG) -f docker/$(TAG).Dockerfile docker

build-alpine-nginx-1.21.6: ## 
  make build TAG="1.21.6-alpine"

build-all: ## Build all images
  make build-alpine-nginx-1.21.6

push-alpine-nginx-1.21.6: ## Push built NGINX 1.21.6 images to Docker Hub
  @docker push $(PREFIX)/$(IMAGE):1.21.6-alpine

push-all: ## Push all built images to Docker Hub
  make push-alpine-nginx

build-and-push-alpine-nginx: ## Build and push 1.21.6-alpine images to Docker Hub
  make build-alpine-nginx-1.21.6
  make push-alpine-nginx-1.21.6

build-and-push: ## Build all images and push them to Docker Hub
  make build-all
  make push-all

clean: ## Clean all containers and images on the system
  -@docker ps -a -q | xargs docker rm -f
  -@docker images -q | xargs docker rmi -f
