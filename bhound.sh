#!/bin/bash

# Quick script so you don't have to remember blood-hound syntax
# Need dock-compose installed for last line which will start docker instance: 
# sudo apt update && sudo apt install docker-compose -y

read -p "Domain (ex. Company.local): " domain

read -p "Username: " username

read -p "Password: " password

read -p "Target IP: " ip 

echo "[+] bloodhound-python -d $domain -u $username -p $password -ns $ip -c all
bloodhound-python -d $domain -u $username -p $password -ns $ip -c all

sleep 2

# Starts BloodHound Community Edition (BHCE) with Docker Compose 
curl -L https://ghst.ly/getbhce | sudo docker compose -f - up

