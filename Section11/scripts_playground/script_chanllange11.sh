#!/bin/bash
users="`who | cut -f1 -d" "`"
date_time="`date +%F\ %H:%M`" #\ to scape the whitespace

echo $date_time >> logged_users.txt
echo "__________________________" >> logged_users.txt
echo $users >> logged_users.txt
echo >> logged_users.txt