#!/bin/bash

#Set Date Variable
#day=$(date -d yesterday +"%Y-%m-%d")
day=$(date --date '-60 min' +"%Y-%m-%d")

# Ransomeware Attacks
~/.local/bin/twint --elasticsearch localhost:9200 -s "ransomware OR decryptors" --since $day --limit 3200
~/.local/bin/twint --elasticsearch localhost:9200 -s "malware OR phishing" --since $day --limit 3200

# Active Attacks
~/.local/bin/twint --elasticsearch localhost:9200 -s "cyberattack OR password" --since $day --limit 3200
~/.local/bin/twint --elasticsearch localhost:9200 -s "exploit OR breach" --since $day --limit 3200
~/.local/bin/twint --elasticsearch localhost:9200 -s "cybercrime OR blackout OR databreach" --since $day --limit 3200

#Industry Topics
~/.local/bin/twint --elasticsearch localhost:9200 -s "infosec OR IOTSecurity OR Securitybydesign" --since $day --limit 3200
~/.local/bin/twint --elasticsearch localhost:9200 -s "cybersecurity OR threatintelligence OR osint OR dataprivacy" --since $day --limit 3200
