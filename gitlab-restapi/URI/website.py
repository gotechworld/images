import time
import urllib.request
import urllib.error
import webbrowser

def uptime_bot(url):
    while True:
        try:
            conn = urllib.request.urlopen(url)
        except urllib.error.HTTPError as e:
            # Email admin / log
            print(f'HTTPError: {e.code} for {url}')
        except urllib.error.URLError as e:
            # Email admin / log
            print(f'URLError: {e.code} for {url}')
        else:
            # Website is up
            print(f'{url} is up')
            webbrowser.open(url)
        time.sleep(300)

if __name__ == '__main__':
    url = 'https://gitlab.altex.ro'
    uptime_bot(url)

webbrowser.open(url)