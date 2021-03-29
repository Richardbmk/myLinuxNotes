# Section 5: The Linux File System

## 35. Viewing Files - Part 1 (cat)

- $ cat /var/log/auth.log ==> cat is for view text files
- $ cat /var/log/auth.log /etc/passwd /etc/group ==> one can display more than one file

- $ cat -n /etc/passwd ==> show also the numbers of lines
- $ cat /etc/hosts

The command "cat" can concatenate multiples files into a single one:
- $ cat /etc/hosts
- $ cat /etc/host.conf

- $ cat /etc/hosts /etc/host.conf > my_host.txt

## 36. Viewing Files - Part 2 (less)

- $ less /var/log/dmesg ==> Show the file in a way you can navagate through

## 37. Viewing Files - Part 3 (tail, head, watch)

- $ tail /var/log/dmesg ==> Show the end of the file
- $ tail -n 2 /etc/group ==> SHow the last 2 lines
- $ tail -n +20 /var/log/syslog ==> Display the last line of the file starting with the line 20 (Show the line 20 to the end!)
- $ tail -f /var/log/auth.log

- $ head /etc/passwd ==> print/show the first 10 lines 
- $ head -n 3 /etc/group ==> show the first lines
- $ head -7 /etc/group ==> Show the first 7 lines


- watch ls ==> watch for changes in this case ls (Ctrl + Cto interrupt) 
- watch -n 3 -d ls -l
- watch -n 1 -d ifconfig ==> xecute ifconfig repeatedly