## Scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues

&nbsp;

`Trivy` 
+ is a simple and comprehensive scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues. 
+ detects vulnerabilities of OS packages (Alpine, RHEL, CentOS, etc.) and language-specific packages (Bundler, Composer, npm, yarn, etc.). 
+ scans Infrastructure as Code (IaC) files such as Terraform, Dockerfile and Kubernetes, to detect potential configuration issues that expose your deployments to the risk of attack. 
+ is easy to use. Just install the binary and you're ready to scan.

&nbsp;

## Infrastructure as Code (Iac)

### Quick start

&nbsp;

> Specify a directory containing IaC files such as Terraform, CloudFormation, Kubernetes and Dockerfile.
`Trivy` will automatically fetch the managed policies and will keep them up-to-date in future scans.

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
  trivy-type-detection
```

&nbsp;

### Results

&nbsp;

Dockerfile (dockerfile)
=======================
Tests: 23 (SUCCESSES: 22, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 1, CRITICAL: 0)

+---------------------------+------------+-----------+----------+------------------------------------------+
|           TYPE            | MISCONF ID |   CHECK   | SEVERITY |                 MESSAGE                  |
+---------------------------+------------+-----------+----------+------------------------------------------+
| Dockerfile Security Check |   DS002    | root user |   HIGH   | Specify at least 1 USER                  |
|                           |            |           |          | command in Dockerfile with               |
|                           |            |           |          | non-root user as argument                |
|                           |            |           |          | -->avd.aquasec.com/appshield/ds002       |
+---------------------------+------------+-----------+----------+------------------------------------------+

cluster-autoscaler.yml (kubernetes)
===================================
Tests: 28 (SUCCESSES: 21, FAILURES: 7, EXCEPTIONS: 0)
Failures: 7 (UNKNOWN: 0, LOW: 2, MEDIUM: 5, HIGH: 0, CRITICAL: 0)

+---------------------------+------------+----------------------------------------+----------+--------------------------------------------+
|           TYPE            | MISCONF ID |                 CHECK                  | SEVERITY |                  MESSAGE                   |
+---------------------------+------------+----------------------------------------+----------+--------------------------------------------+
| Kubernetes Security Check |   KSV001   | Process can elevate its own privileges |  MEDIUM  | Container 'cluster-autoscaler' of          |
|                           |            |                                        |          | Deployment 'cluster-autoscaler' should set |
|                           |            |                                        |          | 'securityContext.allowPrivilegeEscalation' |
|                           |            |                                        |          | to false                                   |
|                           |            |                                        |          | -->avd.aquasec.com/appshield/ksv001        |
+                           +------------+----------------------------------------+----------+--------------------------------------------+
|                           |   KSV003   | Default capabilities not dropped       |   LOW    | Container 'cluster-autoscaler' of          |
|                           |            |                                        |          | Deployment 'cluster-autoscaler'            |
|                           |            |                                        |          | should add 'ALL' to                        |
|                           |            |                                        |          | 'securityContext.capabilities.drop'        |
|                           |            |                                        |          | -->avd.aquasec.com/appshield/ksv003        |
+                           +------------+----------------------------------------+----------+--------------------------------------------+
|                           |   KSV012   | Runs as root user                      |  MEDIUM  | Container 'cluster-autoscaler' of          |
|                           |            |                                        |          | Deployment 'cluster-autoscaler' should     |
|                           |            |                                        |          | set 'securityContext.runAsNonRoot' to      |
|                           |            |                                        |          | true -->avd.aquasec.com/appshield/ksv012   |
+                           +------------+----------------------------------------+----------+--------------------------------------------+
|                           |   KSV014   | Root file system is not read-only      |   LOW    | Container 'cluster-autoscaler'             |
|                           |            |                                        |          | of Deployment                              |
|                           |            |                                        |          | 'cluster-autoscaler' should set            |
|                           |            |                                        |          | 'securityContext.readOnlyRootFilesystem'   |
|                           |            |                                        |          | to true                                    |
|                           |            |                                        |          | -->avd.aquasec.com/appshield/ksv014        |
+                           +------------+----------------------------------------+----------+--------------------------------------------+
|                           |   KSV020   | Runs with low user ID                  |  MEDIUM  | Container 'cluster-autoscaler' of          |
|                           |            |                                        |          | Deployment 'cluster-autoscaler' should     |
|                           |            |                                        |          | set 'securityContext.runAsUser' > 10000    |
|                           |            |                                        |          | -->avd.aquasec.com/appshield/ksv020        |
+                           +------------+----------------------------------------+          +--------------------------------------------+
|                           |   KSV021   | Runs with low group ID                 |          | Container 'cluster-autoscaler' of          |
|                           |            |                                        |          | Deployment 'cluster-autoscaler' should     |
|                           |            |                                        |          | set 'securityContext.runAsGroup' > 10000   |
|                           |            |                                        |          | -->avd.aquasec.com/appshield/ksv021        |
+                           +------------+----------------------------------------+          +--------------------------------------------+
|                           |   KSV023   | hostPath volumes mounted               |          | Deployment 'cluster-autoscaler' should     |
|                           |            |                                        |          | not set 'spec.template.volumes.hostPath'   |
|                           |            |                                        |          | -->avd.aquasec.com/appshield/ksv023        |
+---------------------------+------------+----------------------------------------+----------+--------------------------------------------+

main.tf (terraform)
===================
Tests: 5 (SUCCESSES: 1, FAILURES: 4, EXCEPTIONS: 0)
Failures: 4 (UNKNOWN: 0, LOW: 4, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

+--------------------------+--------------+------------------------------------------+----------+------------------------------------------+
|           TYPE           |  MISCONF ID  |                  CHECK                   | SEVERITY |                 MESSAGE                  |
+--------------------------+--------------+------------------------------------------+----------+------------------------------------------+
| Terraform Security Check | AVD-AWS-0099 | Missing description for security group.  |   LOW    | Security group explicitly uses the       |
|                          |              |                                          |          | default description.                     |
+                          +              +                                          +          +                                          +
|                          |              |                                          |          |                                          |
|                          |              |                                          |          |                                          |
+                          +--------------+------------------------------------------+          +------------------------------------------+
|                          | AVD-AWS-0124 | Missing description for security group   |          | Security group rule does not have a      |
|                          |              | rule.                                    |          | description.                             |
+                          +              +                                          +          +                                          +
|                          |              |                                          |          |                                          |
|                          |              |                                          |          |                                          |
+--------------------------+--------------+------------------------------------------+----------+------------------------------------------+

&nbsp;

### Feature

+ Comprehensive vulnerability detection
OS packages (Alpine Linux, Red Hat Universal Base Image, Red Hat Enterprise Linux, CentOS, AlmaLinux, Rocky Linux, CBL-Mariner, Oracle Linux, Debian, Ubuntu Amazon Linux, openSUSE Leap, SUSE Enterprise Linux, Photon OS and Distroless) Language-specific packages (Bundler, Composer, Pipenv, Poetry, npm, yarn, Cargo, NuGet, Maven, and Go).
+ Misconfiguration detection (IaC scanning)
A wide variety of built-in policies are provided out of the box Kubernetes, Docker, Terraform, and more coming soon.
Support custom policies.
+ Simple
Specify only an image name, a path to config files, or an artifact name.
+ Fast
The first scan will finish within 10 seconds (depending on your network). Consequent scans will finish in single seconds.
+ Easy installation
`apt-get install`, `yum install` and `brew install` are possible.
No pre-requisites such as installation of DB, libraries, etc.
+ High accuracy
Especially Alpine Linux and RHEL/CentOS. Other OS's are also high.
+ DevSecOps
Suitable for CI such as GitHub Actions, Jenkins, GitLab CI, etc.
+ Support multiple targets container image, local filesystem and remote git repository.

[Getting started](https://aquasecurity.github.io/trivy/v0.25.4/)



