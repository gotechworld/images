## Scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues

&nbsp;

`Trivy` 
+ is a simple and comprehensive scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues. 
+ detects vulnerabilities of OS packages (Alpine, RHEL, CentOS, etc.) and language-specific packages (Bundler, Composer, npm, yarn, etc.). 
+ scans Infrastructure as Code (IaC) files such as Terraform, Dockerfile and Kubernetes, to detect potential configuration issues that expose your deployments to the risk of attack. 
+ is easy to use. Just install the binary and you're ready to scan.

&nbsp;

![Trivy](https://aquasecurity.github.io/trivy/v0.17.0/imgs/overview.png)

&nbsp;

```
petrugiurca@petru trivy % make help

Usage:
  make 

Targets:
  help        
  trivy-install-debian-ubuntu 
  trivy-install-rhel-centos 
  trivy-install-rpm 
  trivy-install-macos 
  trivy-check-docker-alpine-oldest-image 
  trivy-check-docker-alpine-latest-image 
  trivy-check-docker-outdated-debian-image 
  trivy-check-docker-current-oracle-lts-image 
  trivy-check-docker-ubuntu-bionic-image 
  trivy-check-docker-ubuntu-xenial-image 

```

&nbsp;

To generate CVE reports, open a terminal and type:
```
$ trivy image --format template --template "@templates/html.tpl" -o cve_alpine:3.15_report.html alpine:3.15  
```

&nbsp;

[Getting started](https://aquasecurity.github.io/trivy/v0.25.4/)



