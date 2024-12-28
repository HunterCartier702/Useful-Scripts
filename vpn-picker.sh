#!/bin/bash

cat <<'EOF'
 _   _______ _   _  ______ _      _             
| | | | ___ \ \ | | | ___ (_)    | |            
| | | | |_/ /  \| | | |_/ /_  ___| | _____ _ __ 
| | | |  __/| . ` | |  __/| |/ __| |/ / _ \ '__|
\ \_/ / |   | |\  | | |   | | (__|   <  __/ |   
 \___/\_|   \_| \_/ \_|   |_|\___|_|\_\___|_|   
                                                
EOF

# Quick script to pick a VPN file if you have mutiple from hackthebox and tryhackme
# Edit to your personal need

echo -e "Pick a vpn file: \n"

echo "[*] 0 = academy-HTB.ovpn"
echo "[*] 1 = lab-HTB.ovpn"
echo "[*] 2 = tryhackme.ovpn"
echo "[*] 3 = AD-THM.ovpn"
echo
read -p "Enter a number to pick a vpn file: " vpn
echo
if [[ "$vpn" -eq 0 ]]; then
	echo "[+] academy-HTB.ovpn"
	sudo openvpn academy-HTB.ovpn
elif [[ "$vpn" -eq 1 ]]; then
	echo "[+] lab-HTB.ovpn"
	sudo openvpn lab-HTB.ovpn
elif [[ "$vpn" -eq 2 ]]; then
	echo "[+] tryhackme.ovpn"
	sudo openvpn tryhackme.ovpn
elif [[ "$vpn" -eq 3 ]]; then 
	echo "[+] AD-THM.ovpn"
	sudo openvpn AD-THM.ovpn
else
	echo "Invalid option: Enter a number to select vpn file"
	exit 1
fi
