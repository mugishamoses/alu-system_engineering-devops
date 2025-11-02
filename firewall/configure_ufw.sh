#!/bin/bash

# Update the package list and install UFW
sudo apt update
sudo apt install -y ufw

# Allow SSH connections
sudo ufw allow 22/tcp

# Allow HTTP connections
sudo ufw allow 80/tcp

# Allow HTTPS connections
sudo ufw allow 443/tcp

# Enable the UFW firewall
sudo ufw enable

# Deny all other incoming connections
sudo ufw default deny incoming

# Allow all outgoing connections
sudo ufw default allow outgoing

# Check the status of the UFW firewall
sudo ufw status verbose
