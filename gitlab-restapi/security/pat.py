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

print("List personal access tokens from other user_id: ")
print()
user_id = sys.argv[1]
access_tokens = gl.personal_access_tokens.list()
print(access_tokens)
