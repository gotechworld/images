# Vulnerability Scanning of any dependency package manager
# on Docker images or File System: apt, yum, node.js, pip, go and so on...

# Common Vulnerabilities and Exposures
# https://www.cve.org/About/Overview
# https://cve.mitre.org/ (old website)
# https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures

.DEFAULT_GOAL:=help
.PHONY: *

help:  ## 
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# ------------- #
# install trivy #
# ------------- #

# https://aquasecurity.github.io/trivy/v0.25.3/getting-started/installation/
trivy-install-debian-ubuntu: ##
	sudo apt-get install wget apt-transport-https gnupg lsb-release
	wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
	echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
	sudo apt-get update
	sudo apt-get install trivy

# Add repository setting to /etc/yum.repos.d
trivy-install-rhel-centos: ##
	sudo vim /etc/yum.repos.d/trivy.repo
	[trivy]
	name=Trivy repository
	baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$releasever/$basearch/
	gpgcheck=0
	enabled=1
	sudo yum -y update
	sudo yum -y install trivy

trivy-install-rpm: ##
	rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.25.3/trivy_0.25.3_Linux-64bit.rpm

trivy-install-macos: ##
	brew install aquasecurity/trivy/trivy

# ------------------ #
# scan docker images #
# ------------------ #

# https://alpinelinux.org/posts/Alpine-3.9.0-released.html
# docker image: alpine:3.9
# 2019-JAN-29 
trivy-check-docker-alpine-oldest-image: ##
	trivy image --clear-cache
	trivy image \
		--exit-code 1 \
		--severity HIGH,CRITICAL \
		--ignore-unfixed \
		alpine:3.9


# https://alpinelinux.org/posts/Alpine-3.15.0-released.html
# docker image: alpine:3.15.0
# 2021-NOV-24 
trivy-check-docker-alpine-latest-image: ##
	trivy image --clear-cache
	trivy image \
		--exit-code 1 \
		--severity HIGH,CRITICAL \
		--ignore-unfixed \
		alpine:3.15.0


# https://www.debian.org/releases/
# docker image: debian:buster-slim
# 2019-JUL-06
trivy-check-docker-outdated-debian-image: ##
	trivy image --clear-cache
	trivy image \
		--exit-code 1 \
		--severity HIGH,CRITICAL \
		--ignore-unfixed \
		debian:buster-slim


# https://https://docs.oracle.com/en/operating-systems/oracle-linux/docker/ol-container-image-tagging.html/
# docker image: oraclelinux:8-slim
# 2022-MAR-12 
trivy-check-docker-current-oracle-lts-image: ##
	trivy image --clear-cache
	trivy image \
		--exit-code 1 \
		--severity HIGH,CRITICAL \
		--ignore-unfixed \
		oraclelinux:8-slim


# https://releases.ubuntu.com/
# docker image: ubuntu:bionic
# 2021-SEPT-16

trivy-check-docker-ubuntu-bionic-image: ##
	trivy image --clear-cache
	trivy image \
		--exit-code 1 \
		--severity HIGH,CRITICAL \
		--ignore-unfixed \
		ubuntu:bionic


# https://releases.ubuntu.com/
# docker image: ubuntu:xenial
# 2020-AUG-18

trivy-check-docker-ubuntu-xenial-image: ##
	trivy image --clear-cache
	trivy image \
		--exit-code 1 \
		--severity HIGH,CRITICAL \
		--ignore-unfixed \
		ubuntu:xenial


# https://aquasecurity.github.io/trivy/v0.25.3/vulnerability/examples/filter/
# how to ignore some vulnerabilities:
# .trivyignore with CVE-2021-33574: --ignorefile .trivyignore 
# --ignore-unfixed




