#!/bin/bash

# Prompt user to select a VPN file
echo -e "Enter a number to pick a VPN file: \n"
echo "0 - htb_academy.ovpn"
echo "1 - starting_point.ovpn"
echo "2 - THM.ovpn"
echo "9 - Exit script"
echo

# Read user input
read -p "Type the number for the VPN file: " vpn

# Handle user input with a case statement
case $vpn in
    0)
        echo "[+] Selected: htb_academy.ovpn"
        sudo openvpn ~/Downloads/htb_academy.ovpn
        ;;
    1)
        echo "[+] Selected: starting_point.ovpn"
        sudo openvpn ~/Downloads/starting_point.ovpn
        ;;
    2)
        echo "[+] Selected: THM.ovpn"
        sudo openvpn ~/Downloads/THM.ovpn
        ;;
    9)
        echo "Exiting script. Goodbye!"
        exit 0
        ;;
    *)
        echo "Error! Please enter a valid option."
        ;;
esac
