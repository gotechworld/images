# gitlab-project-export
Simple python project for exporting gitlab projects with Export Project feature in GitLab API.

Primarily useful for remote backup of projects in GitLab.com to private storage server.

## Prerequisite

* Configured Gitlab API Token, https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html

## Install

Clone the project and install manually:

```
git clone https://gitlab.altex.ro/iac/images.git
cd gitlab-project-export/
sudo python3 setup.py install
```
## Usage

```
usage: gitlab-project-export.py [-h] [-c CONFIG] [-d] [-f]

optional arguments:
  -h, --help  show this help message and exit
  -c CONFIG   config file
  -d          Debug mode
  -f          Force mode - overwrite backup file if exists
```

Edit your config file

`config.yml`

Simply run the script with optional config parameter

`./gitlab-project-export.py -c /path/to/config.yml`

## Configuration
System uses simple yaml file as configuration.

Example below
```
gitlab:                                                   - gitlab configuration
  access:
    gitlab_url: "https://gitlab.altex.ro"                 - GitLab url, official or your instance
    token: "MY_PERSONAL_SECRET_TOKEN"                     - personal access token
  projects:                                               - list of projects to export
    - iac/images
    - iac/helm
    - iac/terraform
    - iac/ansible

  membership: True
  wait_between_exports: 0
  max_tries_number: 12

backup:                                                   - backup configuration
  destination: "/Users/petrugiurca/Desktop/backup/"       - base backup dir
  project_dirs: True                                      - store projects in separate directories
  backup_name: "gitlab-com-{PROJECT_NAME}-{TIME}.tar.gz"  - backup file template
  backup_time_format: "%Y%m%d"                            - TIME template, use whatever compatible with
                                                            python datetime - date.strftime()
  retention_period: 0                                     - purge files in the destination older than the specified value (in days)
  ```


### Backup Usecase in cron [ONLY IN SERVERS]

Create cron file in `/etc/cron.d/gitlab-backup`

With following content
```
MAILTO=your_email@here.tld

0 1 * * * root /path/to/cloned-repo/gitlab-project-export.py -c /etc/gitlab-export/config.yml

```
