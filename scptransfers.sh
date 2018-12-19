#!/usr/bin/expect -f

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
