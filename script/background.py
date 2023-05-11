#!/usr/bin/env python
import requests
# import json
# from bs4 import BeautifulSoup
# from random import randint
# from time import sleep
import os
url = "https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1"
headers = {"user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"}
image_content = requests.get(url=url, headers=headers).json()
image_url = "https://cn.bing.com" + image_content["images"][0]["url"]
image_name = image_content["images"][0]["title"]
data = requests.get(url=image_url, headers=headers)
with open("/home/hpxx/Pictures/" + image_name + ".jpg", "wb") as f:
    f.write(data.content)
    f.close()
os.system("feh --bg-fill /home/hpxx/Pictures/" + image_name + ".jpg")
