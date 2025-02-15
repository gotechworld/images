
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# This Makefile template is an example of how to instantiate a container based on a Docker image using GNU Make.      
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# This example represents some facts related to a private docker registry on my subscription "petrugiurca".     
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# I sign in to the DockerHub registry, created a private repo, build the image, tag the docker image, push the docker image to my private repo, and delete the image locally.                                                                                
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# AXSYS will choose their Private Registry (e.g. AWS ECR / Azure Container Registry) to hosting these Docker images.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



# Pay attention to the Identation!
# As a best practice is recommended to convert Indentation to Tabs!


.DEFAULT_GOAL := help
.PHONY: *

PREFIX := axsys.ro
IMAGE := mysql
TAG := "oraclelinux-8-slim"
PRIVATEREPO := petrugiurca/axsys-mysql-v8.0

help: ##
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ \
	{ printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

login: ## Sign in to DockerHub
	@docker login

build: ## Build MySql v8.0 image
	@docker image build --no-cache --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` -t $(PREFIX)/$(IMAGE):$(TAG) .

tag: ## Tag MySql v8.0 image to DockerHub 
	@docker image tag $(PREFIX)/$(IMAGE):$(TAG) $(PRIVATEREPO)

push: ## Push built MySql v8.0 image to DockerHub
	@docker image push $(PRIVATEREPO)

clean: ## Clean all containers and images on the system
	@docker ps -a -q | xargs docker rm -f 
	@docker images -q | xargs docker rmi -f
