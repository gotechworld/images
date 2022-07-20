## Inspect GitLab CI REST API endpoints

### Prerequisites
+ Read the [documentation](https://python-gitlab.readthedocs.io/en/stable/api-objects.html)
+ Install [pip](https://pip.pypa.io/en/stable/installation/)
+ Install [python-gitlab](https://pypi.org/project/python-gitlab/) module with the `pip` command
+ Install [envparse](https://pypi.org/project/envparse/) module with with the `pip` command


Make use of the attached Python scripts. You can run them either locally or inside a Docker container.

### Steps to run locally

```
alias c="clear"
alias p="python3"
```
```
cd security
p gpg.py 99
p pat.py 99
p ssh-keys.py 99
```

### Steps to run inside a Docker container

```
docker login
docker build --no-cache --target dev . -t python
docker run -it -v ${PWD}:/work python sh
    /work # python --version
    /work # /usr/local/bin/python -m pip install --upgrade pip
    /work # pip install python-gitlab
    /work # pip install envparse
    /work # cd security
    /work/security # python3 gpg.py 99
    /work/security # python3 pat.py 99
    /work/security # python3 ssh-keys.py 99
    /work/security # exit
    
