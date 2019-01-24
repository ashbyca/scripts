#!/usr/bin/expect -f

# Author - Christopher Ashby
# Last Updated - 20190124
#
# A simple script for automating scp downloads. While this script uses expect to securely transfer the password to scp, you have to 
# take precautions to safeguard the script itself as it contains the password. I wouldn’t use this script across the internet, but 
# for LAN transfers using scp it works.

# Prior to use, modifications will need to be made and include:

# 1. Change the user value
# 2. Change the server value
# 3. Change the remote dir
# 4. Change the local directory
# 5. Change the password value

# After save the file and execute the script. All output will be shown in the command window, including any errors if received.

# connect via scp
spawn scp "user@server:/directory/file.ext" /localdirectory/
#######################
expect {
-re ".*es.*o.*" { 
exp_send "yes\r"
exp_continue
}
-re ".*sword.*" {
exp_send "password"
}
}
interact
