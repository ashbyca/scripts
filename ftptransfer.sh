#!/bin/bash

HOST='value'
USER='value'
PASSWD='value'
FILE='file.ext'
REMOTEFILE='file.ext'
LOG='~/ftptransfer.log'

ftp -n $HOST <<END_SCRIPT 
quote USER $USER
quote PASS $PASSWD
cd inventory
put $FILE $REMOTEFILE 
quit
END_SCRIPT
exit 0
