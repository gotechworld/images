.RECIPEPREFIX := $(.RECIPEPREFIX) 
.DEFAULT_GOAL := help
.PHONY: *

PREFIX = 009570627831.dkr.ecr.eu-central-1.amazonaws.com
IMAGE = php

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

test: ## Run all tests; Usage: make test [t="<test-folder-1> <test-folder-2> ..."]
	@cd tests; \
  ./test "$(t)"

build: ## Build image. Usage: make build TAG="7.0-cli"
	@docker build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t $(PREFIX)/$(IMAGE):$(TAG) -f docker/$(TAG).Dockerfile docker

build-72: ## Build PHP 7.2 images
	make build TAG="7.2"
	make build TAG="7.2-cli"
	make build TAG="7.2-nginx"

build-73: ## Build PHP 7.3 images
	make build TAG="7.3"
	make build TAG="7.3-cli"
	make build TAG="7.3-nginx"

build-74: ## Build PHP 7.4 images
	make build TAG="7.4-fpm"
	make build TAG="7.4-cli"
	make build TAG="7.4-nginx"

build-80: ## Build PHP 8.0 images
	make build TAG="8.0-fpm"
	make build TAG="8.0-nginx"

build-81: ## Build PHP 8.1 images
	make build TAG="8.1-fpm"
	make build TAG="8.1-nginx"

build-all: ## Build all images
	make build-72
	make build-73
	make build-74
	make build-80
	make build-81

push-72: ## Push built PHP 7.2 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):7.2
	@docker push $(PREFIX)/$(IMAGE):7.2-cli
	@docker push $(PREFIX)/$(IMAGE):7.2-nginx

push-73: ## Push built PHP 7.3 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):7.3
	@docker push $(PREFIX)/$(IMAGE):7.3-cli
	@docker push $(PREFIX)/$(IMAGE):7.3-nginx

push-74: ## Push built PHP 7.4 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):7.4-fpm
	@docker push $(PREFIX)/$(IMAGE):7.4-cli
	@docker push $(PREFIX)/$(IMAGE):7.4-nginx

push-80: ## Push built PHP 8.0 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):8.0-fpm
	@docker push $(PREFIX)/$(IMAGE):8.0-nginx

push-81: ## Push built PHP 8.1 images to Docker Hub
	@docker push $(PREFIX)/$(IMAGE):8.1-cli
	@docker push $(PREFIX)/$(IMAGE):8.1-fpm
	@docker push $(PREFIX)/$(IMAGE):8.1-nginx

push-all: ## Push all built images to Docker Hub
	make push-72
	make push-73
	make push-74
	make push-80
	make push-81

build-and-push-72: ## Build and push PHP 7.2 images to Docker Hub
	make build-72
	make push-72

build-and-push-73: ## Build and push PHP 7.3 images to Docker Hub
	make build-73
	make push-73

build-and-push-74: ## Build and push PHP 7.4 images to Docker Hub
	make build-74
	make push-74

build-and-push-80: ## Build and push PHP 8.0 images to Docker Hub
	make build-80
	make push-80

build-and-push-81: ## Build and push PHP 8.1 images to Docker Hub
	make build-81
	make push-81

build-and-push: ## Build all images and push them to Docker Hub
	make build-all
	make push-all

clean: ## Clean all containers and images on the system
	-@docker ps -a -q | xargs docker rm -f
	-@docker images -q | xargs docker rmi -f
