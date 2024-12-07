#!/usr/bin/env python3 

import requests

resp = requests.get('http://httpbin.org/ip')
print(resp.content.decode())
