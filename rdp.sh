#!/bin/bash

cat <<'EOF'
       __              __________________ 
      / _|             | ___ \  _  \ ___ \
__  _| |_ _ __ ___  ___| |_/ / | | | |_/ /
\ \/ /  _| '__/ _ \/ _ \    /| | | |  __/ 
 >  <| | | | |  __/  __/ |\ \| |/ /| |    
/_/\_\_| |_|  \___|\___\_| \_|___/ \_|    
                                                                                    	
EOF

# use xfreerdp to remote into windows machines with or without an attached shared directory & transfer files easily 
read -p "IP: " IP
read -p "Username: " user
echo -n "Password [hidden]: "
stty -echo        # Disable echoing
read pass         # Read the password
stty echo         # Re-enable echoing
echo
read -p "Add drive (Optional) Enter to Continue: " SHAREPATH # Example: /home/$USER or type . for current directory

if [ -z "$SHAREPATH" ]; then
	echo "[+] xfreerdp /v:$IP /u:$user /p:'****' /dynamic-resolution"
	xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution
else
	echo "[+] xfreerdp /v:$IP /u:$user /p:'****' /dynamic-resolution /drive:Share,$SHAREPATH"
	xfreerdp /v:$IP /u:$user /p:$pass /dynamic-resolution /drive:Share,$SHAREPATH
fi
