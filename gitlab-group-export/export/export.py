import gitlab
import os
import sys
import urllib3
import time
from envparse import env
from datetime import datetime

if os.path.isfile('.env'):
    env.read_envfile()

ACCESS_TOKEN = env('ACCESS_TOKEN')
URI = env('URI')

gl = gitlab.Gitlab(URI, ACCESS_TOKEN, ssl_verify=False, per_page=100)
urllib3.disable_warnings() 

# Create the export
group = gl.groups.get(66)
export = group.exports.create()

# Wait for the export to finish
time.sleep(5)

# Download the result
with open('/tmp/export.tgz', 'wb') as f:
    export.download(streamed=True, action=f.write)