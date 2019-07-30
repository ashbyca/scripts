#!/bin/bash

#Set Date Variable
#day=$(date -d yesterday +"%Y-%m-%d")
day=$(date --date '-60 min' +"%Y-%m-%d")

# Cyber Professionals
~/.local/bin/twint --elasticsearch localhost:9200 -s "schneierblogtwin OR mikko OR briankrebs OR neiljrubenking OR dangoodin001 OR gcluley OR campuscodi OR peterkruse OR e_kaspersky OR troyhunt" --since $day --limit 200
~/.local/bin/twint --elasticsearch localhost:9200 -s "SwiftOnSecurity OR jaysonstreet OR deb_infosec OR StewartRoom OR joshcorman OR k8em0 OR LutaSecurity OR BrianHonan OR annie_bdc OR taosecurity" --since $day --limit 200
~/.local/bin/twint --elasticsearch localhost:9200 -s "USCERT_gov OR neiljrubenking OR dangoodin001 OR campuscodi OR peterkruse OR shirastweet OR nakashimae OR iblametom OR evacide OR DanielMiessler" --since $day --limit 200
~/.local/bin/twint --elasticsearch localhost:9200 -s "evanderburg OR ScottBVS OR jack_daniel OR anton_chuvakin OR lennyzeltser OR JosephSteinberg OR RobertMLee OR TroelsOerting OR ejhilbert OR PatrickCMiller" --since $day --limit 200


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
