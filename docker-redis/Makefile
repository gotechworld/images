.RECIPEPREFIX := $(.RECIPEPREFIX) 
.DEFAULT_GOAL := help
.PHONY: *

PREFIX = axsys.ro
IMAGE = redis

help:
	@echo "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build image. Usage: make build TAG="nginx"
	@docker build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t $(PREFIX)/$(IMAGE):$(TAG) -f docker/$(TAG).Dockerfile docker

build-4.0.9: ## 
	make build TAG="4.0.9"

build-5.0.14: ## 
	make build TAG="5.0.14"

build-6.0.9: ## 
	make build TAG="6.0.9"

build-6.2.6: ## 
	make build TAG="6.2.6"

build-all: ## Build all images
	make build-4.0.9
	make build-5.0.14
	make build-6.0.9
	make build-6.2.6

push-4.0.9: ## Push built REDIS 4.0.9 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):4.0.9

push-5.0.14: ## Push built REDIS 5.0.14 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):5.0.14

push-6.0.9: ## Push built REDIS 6.0.9 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):6.0.9

push-6.2.6: ## Push built REDIS 6.2.6 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):6.2.6

push-all: ## Push all built images to Docker Hub
	make push-4.0.9
	make push-5.0.14
	make push-6.0.9
	make push-6.2.6

build-and-push-4.0.9: ## Build and push REDIS 4.0.9 images to Docker Hub
	make build-4.0.9
	make push-4.0.9

build-and-push-5.0.14: ## Build and push REDIS 5.0.14 images to Docker Hub
	make build-5.0.14
	make push-5.0.14

build-and-push-6.0.9: ## Build and push REDIS 6.0.9 images to Docker Hub
	make build-6.0.9
	make push-6.0.9

build-and-push-6.2.6: ## Build and push REDIS 6.2.6 images to Docker Hub
	make build-6.2.6
	make push-6.2.6

build-and-push: ## Build all images and push them to Docker Hub
	make build-all
	make push-all

clean: ## Clean all containers and images on the system
	-@docker ps -a -q | xargs docker rm -f
	`-@docker images -q | xargs docker rmi -f
