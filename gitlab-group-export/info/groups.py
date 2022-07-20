import gitlab
import os
import sys
import urllib3
from envparse import env
from datetime import datetime

if os.path.isfile('.env'):
    env.read_envfile()

ACCESS_TOKEN = env('ACCESS_TOKEN')
URI = env('URI')

gl = gitlab.Gitlab(URI, ACCESS_TOKEN, ssl_verify=False, per_page=100)
urllib3.disable_warnings() 

# List the groups
groups = gl.groups.list()
print(groups)
print()
print("-=-=-=-" * 3)
print()

# Get a group’s detail
group = gl.groups.get(120)
print(group)
print()
print("-=-=-=-" * 3)
print()

# List a group’s projects
projects = group.projects.list()
print(projects)