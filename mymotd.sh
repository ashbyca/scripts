#!/bin/bash
# This is my current dynamic banner for Ubuntu systems
# Last Updated 20190910
# Author Christopher Ashby

# Install Dependiencies (if requried)
sudo apt-get install lsb-release && sudo apt-get install figlet && sudo apt-get install update-motd && sudo apt-get install wget -y

# Remove the current directory
sudo rm -r /etc/update-motd.d/

# Create new directory
sudo mkdir /etc/update-motd.d/

# Download 00-header, 10-sysinfo, 90-footer and change permissions
cd /etc/update-motd.d/ 

sudo wget https://gist.githubusercontent.com/ashbyca/9ce85acbcb17e5ecd6055e9c88837158/raw/a0d9dcfd5ff4283ab8cdcdbeedb24796dfd4946b/00-header
#sudo mv 9ce85acbcb17e5ecd6055e9c88837158 00-header

sudo wget https://gist.githubusercontent.com/ashbyca/582cf06398ceeb651548bef1743605b8/raw/6785d9f3c08105959c69d285560dc76076ae649e/10-sysinfo
#sudo mv 582cf06398ceeb651548bef1743605b8 10-sysinfo

sudo wget https://gist.githubusercontent.com/ashbyca/a7bd031c7efdd9c9c5fe53f9a5dc49ae/raw/20be9196dfd3fbceac2e074d6b3dd0956892ac6f/90-footer
#sudo mv a7bd031c7efdd9c9c5fe53f9a5dc49ae 90-footer

sudo chmod +x /etc/update-motd.d/*

# remove MOTD file
rm /etc/motd.dynamic
