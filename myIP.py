#!/usr/bin/env python3 

import requests

# Grab your public IP address
resp = requests.get('http://httpbin.org/ip')
print(resp.content.decode())
