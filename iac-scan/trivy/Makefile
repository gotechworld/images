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

# ----------------------------- #
# scan mixed types of IaC files #
# ----------------------------- #

# https://aquasecurity.github.io/trivy/v0.25.4/docs/misconfiguration/iac/
# Simply specify a folder containing IaC files
# Trivy will automatically fetch the managed policies and will keep them up-to-date in future scans.

trivy-type-detection: ##
	trivy conf ./configs

# https://aquasecurity.github.io/trivy/v0.25.3/vulnerability/examples/filter/
# how to ignore some vulnerabilities:
# .trivyignore with CVE-2021-33574: --ignorefile .trivyignore 
# --ignore-unfixed




