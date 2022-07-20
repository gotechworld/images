.RECIPEPREFIX := $(.RECIPEPREFIX) 
.DEFAULT_GOAL := help
.PHONY: *

PREFIX = 009570627831.dkr.ecr.eu-central-1.amazonaws.com
IMAGE = composer-php

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

test: ## Run all tests; Usage: make test [t="<test-folder-1> <test-folder-2> ..."]

build: ## Build image. Usage: make build TAG="7.0-cli"
	@docker build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` -t $(PREFIX)/$(IMAGE):$(TAG) -f docker/$(TAG).Dockerfile docker

build-composer-php73: ## Build PHP 7.3 images and composer 2
	make build TAG="7.3"
	make build TAG="7.3-C190"

build-composer-php71-C190: ## Build PHP 7.1 images and composer 1.9.0
	make build TAG="7.1-C190"

build-composer-php73-C190: ## Build PHP 7.3 images and composer 1.9.0
	make build TAG="7.3-C190"

build-composer-php80-C20: ## Build PHP 8.0 images and composer 2
	make build TAG="8.0-C20"

build-composer-php80-C21: ## Build PHP 8.0 images and composer 2.1.9
	make build TAG="8.0-C219"

build-all: ## Build all images
	make build-composer-php73
	make build-composer-php71-C190
	make build-composer-php73-C190
	make build-composer-php80-C20
	make build-composer-php80-C21

push-composer-php71-C190: ## Push built PHP 7.1 images
	@docker push $(PREFIX)/$(IMAGE):7.1-C190

push-composer-php73: ## Push built PHP 7.3 images
	@docker push $(PREFIX)/$(IMAGE):7.3
	@docker push $(PREFIX)/$(IMAGE):7.3-C190

push-composer-php73-C190: ## Push built PHP 7.3 images
	@docker push $(PREFIX)/$(IMAGE):7.3-C190

push-composer-php80-C20: ## Push built PHP 8.0 images and composer 2.0
	@docker push $(PREFIX)/$(IMAGE):8.0-C20

push-composer-php80-C21: ## Push built PHP 8.0 images and composer 2.1.9
	@docker push $(PREFIX)/$(IMAGE):8.0-C219

push-all: ## Push all built images to Docker Hub
	make push-composer-php73
	make push-composer-php71-C190
	make push-composer-php73-C190
	make push-composer-php80-C20
	make push-composer-php80-C21

build-and-push-71: ## Build and push PHP 7.1 images
	make build-composer-php71-C190
	make push-composer-php71-C190

build-and-push-73: ## Build and push PHP 7.3 images
	make build-composer-php73
	make push-composer-php73

build-and-push-80-c21: ## Build and push PHP 7.3 images
	make build-composer-php80-C21
	make push-composer-php80-C21

clean: ## Clean all containers and images on the system
	-@docker ps -a -q | xargs docker rm -f
	-@docker images -q | xargs docker rmi -f
