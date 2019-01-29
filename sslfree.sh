#!/bin/bash

# Simple script to download, convert, and install SSLforfree certificate
# Last updated : 20190101

# Download and extract ssl zip
sudo cp /box-storage/sslforfree.zip /home/ashbyc/
unzip sslforfree.zip 

# Convert key file to pem
openssl rsa -in private.key -text > private.pem

# Convert crt to pem
openssl x509 -in mycert.crt -out mycert.pem -outform PEM

# Move new files into place and ensure permissions
sudo mv *.pem /opt/gravwell/etc
sudo chown gravwell:gravwell /opt/gravwell/etc/mycert.pem
sudo chown gravwell:gravwell /opt/gravwell/etc/mykey.pem

# Restart services and cleanup
sudo service gravwell_webserver restart
sudo rm -f ca_bundle.crt certificate.crt private.key sslforfree.zip 
