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

gl = gitlab.Gitlab(URI, ACCESS_TOKEN, ssl_verify= False , per_page= 100)
urllib3.disable_warnings() 

print()
print("Date and Time: ", datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
print()

print("List SSH keys for a user: ")
print("-=-=-=-" * 3)
userId = sys.argv[1]
user = gl.users.get(userId)
keys = user.keys.list()
print(keys)
print(user.name)
print(user.state)
print("-=-=-=-" * 3)
print()