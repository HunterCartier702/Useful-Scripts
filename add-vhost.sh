#!/usr/bin/env bash

read -p "Enter IP: " IP
read -p "Enter or copy/paste vhosts list: " vhosts

printf "%s\t%s\n\n" "$IP" "$vhosts" | sudo tee -a /etc/hosts