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