#!/usr/bin/env bash

# A script to download tools I use commonly not currently included on a fresh kali install 

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    echo "Usage: sudo ./script.sh"
    exit 1
fi

echo "Updating package lists and upgrading system..."
apt update && apt upgrade -y

# List of tools to install
TOOLS=(
    gobuster
    netcat
    rlwrap
    seclists
    freerdp2-x11
    jq
    dirsearch
    sshuttle
)

echo "Installing common tools..."
apt install -y "${TOOLS[@]}"

echo "Adding Sublime Text repository..."

# Install necessary packages for adding repositories
apt install -y wget gpg

# Download and add the GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor -o /usr/share/keyrings/sublime-text.gpg

# Add the Sublime Text APT repository
echo "deb [signed-by=/usr/share/keyrings/sublime-text.gpg] https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

# Update package lists and install Sublime Text
apt update && apt install -y sublime-text

echo "Cleaning up..."
apt autoremove -y && apt clean

echo "Installation complete!"
