import gitlab
import os
import urllib3
from envparse import env
from datetime import datetime

if os.path.isfile('.env'):
    env.read_envfile()

ACCESS_TOKEN = env('ACCESS_TOKEN')
URI = env('URI')

gl = gitlab.Gitlab(URI, ACCESS_TOKEN, ssl_verify= False , per_page= 100)
urllib3.disable_warnings() 

print()
print("Date and Time: ", datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
print()
print("List all projects: ")

def get_projects():
    projects = gl.projects.list(all=True)
    for project in projects:
        print()
        print("-=-=-=-" * 3)
        print(project.name)

def main():
    get_projects()
    print()
main()

