import gitlab 
import os
import urllib3
import csv 
import sys 
import time
import webbrowser
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

groups = gl.groups.list (all=True)

data = [] 
for group in groups: 
    members = group.members.list (all = True) 
    group_info = {} 
    if members: 
        for member in members: 
            members_info = [] 
            members_info.append(group.name)             
            members_info.append(group .web_url)             
            members_info.append(member.name)             
            members_info.append(member.state)             
            members_info.append(member.access_level)             
            members_info.append(member.expires_at)             
            data.append(members_info)  
          
with  open ( 'members.csv' , 'w' ,encoding= 'UTF-8' ) as f: 
    f_csv = csv.writer(f) 
    f_csv.writerows(data)

time.sleep(5)
webbrowser.open("https://docs.gitlab.com/ee/api/access_requests.html#approve-an-access-request")