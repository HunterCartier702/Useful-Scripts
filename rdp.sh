#!/bin/bash

# Quick script to use xfreerdp to remote into windows machines with or without a drive attached

read -p "IP: " IP
read -p "Username: " USER
read -p "Password: " PASS
#Example /home/$USER/skripts
read -p "Path on local box files to upload to target host(Optional Press Enter to Continue): " SHAREPATH

if [ -z "$SHAREPATH" ]; then
	echo "[+] xfreerdp /v:$IP /u:$USER /p:$PASS /dynamic-resolution"
	xfreerdp /v:$IP /u:$USER /p:$PASS /dynamic-resolution
else
	echo "[+] xfreerdp /v:$IP /u:$USER /p:$PASS /dynamic-resolution /drive:New_Share,$SHAREPATH"
	xfreerdp /v:$IP /u:$USER /p:$PASS /dynamic-resolution /drive:New_Share,$SHAREPATH
fi
