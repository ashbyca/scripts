#!/bin/bash

# Simple script to update tools
# All tools are located in /opt
# Last updated : 20180910

LOG_LOCATION="/home/ashbyc"    
LOG_FILE="gitupdate.log"
exec >> $LOG_LOCATION/gitupdate.log 2>&1

# Update apt2
cd /opt/apt2/
sudo git pull 

# Update Autosploit
# cd /opt/Autosploit/
# sudo git pull 

# Update credmap
cd /opt/credmap/
sudo git pull 

# Update dnstwist
cd /opt/dnstwist/
sudo git  pull

# Update domain_analyzer
cd /opt/domain_analyzer/
sudo git pull

# Update getsploit
cd /opt/getsploit/
sudo git pull

# Update Just-Metadata
cd /opt/Just-Metadata/
sudo git pull

# Update recon-ng
cd /opt/recon-ng/
sudo git pull

# Update theHarvester
cd /opt/theHarvester/
sudo git pull

# Update wig
cd /opt/wig/
sudo git pull
