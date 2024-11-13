#!/bin/bash

# Quick script to use xfreerdp to remote into windows machines with or without a drive attached

read -p "IP: " IP
read -p "Username: " user
read -p "Password: " pass
read -p "/drive: (Optional) Press Enter to Continue: " SHAREPATH # Example: /home/$USER/skripts

if [ -z "$SHAREPATH" ]; then
	echo "[+] xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution"
	xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution
else
	echo "[+] xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution /drive:New_Share,$SHAREPATH"
	xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution /drive:New_Share,$SHAREPATH
fi
