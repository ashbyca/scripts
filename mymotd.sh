#!/bin/bash
# This is my current dynamic banner for Ubuntu systems
# Last Updated 20190910
# Author Christopher Ashby

# Install Dependiencies (if requried)
sudo apt-get install lsb-release && sudo apt-get install figlet && sudo apt-get install update-motd && sudo apt-get install wget -y

# Remove the current directory
sudo rm -r /etc/update-motd.d/

# Create new directory and download dynamic files
sudo mkdir /etc/update-motd.d/
Wwget
# create dynamic files
touch /etc/update-motd.d/00-header ; touch /etc/update-motd.d/10-sysinfo ; touch /etc/update-motd.d/90-footer


chmod +x /etc/update-motd.d/*
# remove MOTD file
rm /etc/motd.dynamic
