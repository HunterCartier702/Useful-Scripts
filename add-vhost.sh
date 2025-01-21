#!/usr/bin/env bash

read -p "Enter IP: " IP
read -p "Enter or copy/paste vhosts list: " vhosts
cat /etc/hosts
echo "------"
printf "%s\t%s\n\n" "$IP" "$vhosts" | sudo tee -a /etc/hosts
echo "------"
cat /etc/hosts
