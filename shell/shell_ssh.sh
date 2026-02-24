#!/usr/bin/expect -f
# ios_ssh.sh  <host> <username> <password>
set host [lindex $argv 0]
set user [lindex $argv 1]
set pass [lindex $argv 2]

spawn ssh -o StrictHostKeyChecking=no $user@$host
expect "*assword: "
send "$pass\n"
expect "*#"
send "show ip int brief\n"
expect eof
