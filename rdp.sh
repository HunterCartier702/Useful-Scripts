#!/bin/bash

cat <<'EOF'
       __              __________________ 
      / _|             | ___ \  _  \ ___ \
__  _| |_ _ __ ___  ___| |_/ / | | | |_/ /
\ \/ /  _| '__/ _ \/ _ \    /| | | |  __/ 
 >  <| | | | |  __/  __/ |\ \| |/ /| |    
/_/\_\_| |_|  \___|\___\_| \_|___/ \_|    
                                                                                    	
EOF

# Quick script to use xfreerdp to remote into windows machines with or without an attached shared directory feature which allows you to access files and folders between the local machine and the remote desktop.

read -p "IP: " IP
read -p "Username: " user
read -p "Password: " pass
read -p "/drive: (Optional) Press Enter to Continue: " SHAREPATH # Example: /home/$USER or type . for current directory

if [ -z "$SHAREPATH" ]; then
	echo "[+] xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution"
	xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution
else
	echo "[+] xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution /drive:New_Share,$SHAREPATH"
	xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution /drive:Share,$SHAREPATH
fi
