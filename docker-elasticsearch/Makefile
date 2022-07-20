.RECIPEPREFIX := $(.RECIPEPREFIX) 
.DEFAULT_GOAL := help
.PHONY: *

PREFIX = axsys.ro
IMAGE = elasticsearch

help:
	@echo "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build image. Usage: make build TAG="elasticsearch"
	@docker build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t $(PREFIX)/$(IMAGE):$(TAG) -f docker/$(TAG).Dockerfile docker

build-7.3: ## 
	make build TAG="7.3"

build-7.8: ## 
	make build TAG="7.8"

build-all: ## Build all images
	make build-7.8

push-7.8: ## Push built ELASTICSEARCH 7.8 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):7.8

push-7.3: ## Push built ELASTICSEARCH 7.3 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):7.3

push-all: ## Push all built images to Docker Hub
	make push-7.3
	make push-7.8

build-and-push-7.3: ## Build and push ELASTICSEARCH 7.3 images to Docker Hub
	make build-7.3
	make push-7.8\3

build-and-push-7.8: ## Build and push ELASTICSEARCH 7.8 images to Docker Hub
	make build-7.8
	make push-7.8

build-and-push: ## Build all images and push them to Docker Hub
	make build-all
	make push-all

clean: ## Clean all containers and images on the system
	-@docker ps -a -q | xargs docker rm -f
	`-@docker images -q | xargs docker rmi -f
