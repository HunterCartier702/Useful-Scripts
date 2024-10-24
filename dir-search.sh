#!/bin/bash

# Quickly enumerate directories for keywords that may contain version info. I used Joomla CMS in this example. I grabbed a list of directories from /robots.txt
# Use this as an example to create your own script and automate as much as you can

url="ip:port" #Change this

directory=("/media" \
"/modules" \
"/images" \
"/templates" \
"/bin" \
"/plugins" \
"/includes" \
"/language" \
"/components" \
"/cache" \
"/libraries" \
"/tmp" \
"/layouts" \
"/administrator")

for i in "${directory[@]}"; do
	request=$(curl -s "$url$i" | grep -i 'joomla')
	echo "$request"
done
