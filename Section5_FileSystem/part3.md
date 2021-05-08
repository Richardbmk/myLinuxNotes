# Section 5: The Linux File System

## 47. Finding Files and Directories - Part 1 (locate, which)

- $ sudo apt intall mlocate ==> install the localte command
- $ sudo updatedb ==> update the locate databse

- $ /var/lib/mlocate ==> location of the mlocate database
- $ locate -S ==> show some statistics related to locate
- $ locate passwords ==> return a path (the absolute path name) names that contain the passwords string
- $ locate eahorse

- $ locate -b eahorse ==> "b" base name
- $ locate -b '\eahorse' ==> looks for exact match
- $ locate -b 'shadow'
- $ locate -b '\shadow'

- $ touch myfile123x
- $ locate myfile123x ==> will not find anything cause the new file doesn't exist in locate database
- $ sudo updatedb
- $ locate myfile123x
- $ rm myfile123x
- $ locate myfile123x

- $ locate -e myfile123x ==> Check if the file realy exist

- $ locate Rainshadow ==> linux is case sensitive
- $ locate -i Rainshadow ==> "i" ignores the uppletter

Seaching if regex "-r":
- $ locate -b -r '^shadow\.[0-9]' ==> searching for files and directories who is base name start with "shadow" and the "." sing and any digit between 0 and 9 and any other characters can follow.

- $ which rm ==> display the command to the "rm" command
- $ which ls ==> by defaul it only diplay the first match

- $ which -a find ==> "-a" to display more options
- $ ls -l /bin/find
- $ which pwd ifconfig find grep firefox

## 49. Finding Files and Directories - Part 2 (find)

find ==> search by criteria (groups, users, etc)

- $ man find

EXAMPLE
- $ mkdir projects
- $ touch projects/report.txt
- $ touch projects/todo.txt
- $ tree projects/
- $ find . -name todo.txt ==> search in the current directory by name
- $ find . -iname TodO.txt ==> search in the current directory by name and case insensitive.

- $ find . -name todo ==> does not find any match
- $ find . -name todo* ==> find a match
- $ find . -name "todo*" ==> find a match
- $ find . -name "*rep*" ==> any file o directory that contains "rep"
- $ find - -name todo.txt -delete ==> find and delete without posibility of recover it
- $ tree projects/

- $ find /etc/ -name passwd ==> will not work, you need to be a root
- $ sudo find /etc/ -name passwd
- $ sudo find /etc/ -name passwd -ls

- $ find /etc/ -type d ==> "d" is for directory. Search by type directores and subdirectories

- $ find /etc/ -type d -maxdepth 2 ==> "maxdepth" specify the depth of the search, in this case only 2 subdirectories

- $ find /etc/ -type d -maxdepth 2 -perm 755 ==> "perm" is for permisions
- $ find /etc/ -type d -maxdepth 2 -perm 755 | wc -l==> number of directories

- $ sudo find /var -type f -size 100k -ls ==> "f" is for files. Search file with size of 100k
- $ sudo find /var -type f -size +10M -ls ==> Search for files > 10M
- $ sudo find /var -type f -size -10k -ls ==> Search for files < 10k
- $ sudo find /var -type f -size +5M -size -10M ==> Search betwee sizes

SEARCH BY TIMESTAMP:
- $ find /var -type f -mtime 0 -ls ==> Search de files *modifyes* in the last 24h ("0" means the las 24h)
- $ find /var -type f -mtime 1 -ls ==> files between 1 a 2 days ago
- $ find /var/ -type f -atime +1 -ls ==> files *accessed* at least 2 days ago. "+1" mean > 1

- $ find /var/ -type -mmin -5 ==> modification time is less than 50 minuts

- $ find /var/ -type f -user gdm -ls ==> search by user. The user is "gdm"

- $ find /etc/ -type f -not -group root ls ==> files that not belong to the group root

## 50. Find and Exec

- $ sudo find /etc -type f -mtime 0 ==> files modifies on the last day

- $ sudo find /etc -type f -mtime 0 -exec cat {} \; ==> this line display the content of all the files

- $ sudo mkdir /root/backup
- $ sudo find /etc/ -mtime -7 -type f -exec cp {} /root/backup \; ==> make a copy of modified files in the last 7 days en the backup path
- $ sudo ls -l /root/backup

- $ sudo find /etc/ -mtime -7 -type f -ok cp {} /root/backup \; ==> make a copy of modified files in the last 7 days en the backup path. "ok" ask before executing!

## 51. Searching for String Patterns in Text Files (grep)

- $ man grep
- $ grep user /etc/ssh/ssh_config ==> search for the string user in some file
- $ grep "command line" /etc/ssh/ssh_config
- $ grep -i "SSH" /etc/ssh/ssh_config ==> "i" make the search case insensitive
- $ grep -i -n "SSH" /etc/ssh/ssh_config ==> "i" make the search case insensitive. "n" print the line number

- $ grep body /etc/passwd ==> search for somthing incloud "body"

- $ grep -w body /etc/passwd ==> search for only that word

- $ grep kernel /var/log/dmesg
- $ grep -v kernel /var/log/dmesg ==> "v" invert the match

SEARCH IN A BINARY FILE
- $ grep root /var/log/auth.log ==> does not search for anything
- $ grep -a root /var/log/auth.log ==> "a" allow to search in a binary file

SEARCH IN A DIRECTORY:
- $ grep 127.0.0.1 /etc/ ==> does not find
- $ grep -R 127.0.0.1 /etc/ ==> now it will work! "R" find recursively in all of the directories and subdirectories.
- $ sudo grep -R 127.0.0.1 /etc/
- $ sudo grep -s -R 127.0.0.1 /etc/ ==> "s" filter by error message (no such file,...)

- $ grep -c error /var/log/syslog ==> gives a number. n lines that contain x strings

- $ grep error /var/log/syslog
- $ grep error /var/log/syslog | wc -l ==> also give a number

- $ dmesg ==> prints the kernel ring buffer
- $ dmesg | grep error

- $ dmesg | grep -A 3 -B 4 error ==> prints *Before* and *After* the match
- $ dmesg | grep -C 3 error ==> prints 3 lines *Before* and *After* the match

- $ sudo netstat -tupan ==> Display all open ports
- $ sudo netstat -tupan | grep 53 
- $ sudo netstat -tupan | grep 80

- $ ls -RF /etc/ ==> "F" add a character or symbol depending on the type of file
- $ ls -RF /etc/ | grep / ==> search for only for directories
- $ ls -RF /etc/ | grep -v / ==> search for only for not directories

- $ ls -RF /etc/ | grep -v / | grep -v "^$" ==> search for only for not directories and exclude empty lines

- $ sudo ls -RF /etc/ | grep -v / | grep -v "^$" | wc -l ==> search for only for not directories and exclude empty lines. How many they are

- $ sudo ls -RF /etc/ | grep -v / | grep -v "^$" | sort -r ==> search for only for not directories and exclude empty lines. And reverse sort by name

- $ sudo ls -RF /etc/ | grep -v / | grep -v "^$" | sort -r | less ==> search for only for not directories and exclude empty lines. And reverse sort by name. "less" is for easy navegation

- $ sudo ls -RF /etc/ | grep -v / | grep -v "^$" | sort | less ==> search for only for not directories and exclude empty lines. And sort by name (ascending alphabetical order). "less" is for easy navegation

- $ sudo ls -RF /etc/ | grep -v / | grep -v "^$" | sort | less > files ==> search for only for not directories and exclude empty lines. And sort by name (ascending alphabetical order). "less" is for easy navegation. Redirect to a file
- cat files


## 53. Searching for Strings in Binary Files (strings)

- $ man strings

- $ which ls ==> to see the path
- strings /usr/bin/ls
- strings /usr/bin/ls | less
- $ /help ==> search for the string help (press "n" to see the next occurence)

- $ df -h ==> see the partition mounted in the root directory
- $ sudo strings -a /dev/sda5

- $ ls -l /dev/mem ==> seach directly in to the machine memory
- $ sudo strings /dev/mem | less ==> you will printable characters in the computer memory.

