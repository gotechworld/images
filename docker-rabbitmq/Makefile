.RECIPEPREFIX := $(.RECIPEPREFIX) 
.DEFAULT_GOAL := help
.PHONY: *

PREFIX = axsys.ro
IMAGE = rabbitmq

help:
	@echo "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build image. Usage: make build TAG="rabbitmq"
	@docker build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t $(PREFIX)/$(IMAGE):$(TAG) -f docker/$(TAG).Dockerfile docker

build-3.7: ## 
	make build TAG="3.7"

build-3.8: ## 
	make build TAG="3.8"

build-3.9: ## 
	make build TAG="3.9"

build-all: ## Build all images
	make build-3.7
	make build-3.8
	make build-3.9

push-3.7: ## Push built RabbitMQ 3.7 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):3.7

push-3.8: ## Push built RabbitMQ 3.8 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):3.8

push-3.9: ## Push built RabbitMQ 3.9 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):3.9

push-all: ## Push all built images to Docker Hub
	make push-3.7
	make push-3.8
	make push-3.9

build-and-push-3.7: ## Build and push RabbitMQ 3.7 images to Docker Hub
	make build-3.7
	make push-3.7

build-and-push-3.8: ## Build and push RabbitMQ 3.8 images to Docker Hub
	make build-3.8
	make push-3.8

build-and-push-3.9: ## Build and push RabbitMQ 3.9 images to Docker Hub
	make build-3.9
	make push-3.9

build-and-push: ## Build all images and push them to Docker Hub
	make build-all
	make push-all

clean: ## Clean all containers and images on the system
	-@docker ps -a -q | xargs docker rm -f
	`-@docker images -q | xargs docker rmi -f

