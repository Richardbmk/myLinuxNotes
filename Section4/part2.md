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

## 39. Creating Files and Directories (touch, mkdir)
- $ man mkdir
- $ mkdir -v dir2 ==> Display a message after the creation of the dir2 directory.
- $ mkdir dir3 dir1/dir10 /tmp/tmp_dir ==> create more than one directory
- $ mkdir -p first/second/third ==> The "p" is for parent, create the parent directory as needed. Create all directories and subdirectories.
- tree first/

## 40. Copying Files and Directories (cp)

- $ cp /etc/passwd ./users.txt ==> copy file of the first argument to users.txt (create or override)
- $ cp -v /etc/group ./users.txt ==> "v" mean verbose (This just propt the acction in the terminal)
- $ cp -i /etc/group ./users.txt ==> ask before executing the action- "i" means interactive

--> cp with more than one argument
- $ cp learning_linux.txt logs users.txt first/ ==> Coy the first 3 arguments to the last argument

--> Recursive copy of directories
- $ sudo cp -r /etc/ ~/Desktop ==> To copy directories you need to use "-r"

- The user that run the cp command becomes the file owner
- sudo cp -p users.txt u1.txt ==> "-p" preserve the user permisions (belongs to the user)

## 41. Moving and Renaming Files and Directories (mv)

moves or rename files or directories
--> Play to understand
- $ mkdir -p dir1/dir2
- $ touch dir1/a.txt dir1/dir2/b.txt c.txt
- $ ls
- $ tree dir1/

- $ mv dir1/dir2/b.txt dir1/
- $ tree dir1/

- $ mv c.txt dir1/a.txt dir1/b.txt dir1/dir2/ 

- $ dir1/dir2/*.txt dir1/
- $ tree dir1/

- $ mkdir dir1/dir2/dir3
- $ tree dir1/

- $ mv dir1/dir2/dir3/ dir1/
- $ tree dir1/

- $ touch dir1/dir2/a.txt
- $ tree dir1/
- $ mv dir1/dir2/a.txt dir1/ ==> if the files exist overides it
- $ tree dir1/

- $ touch dir1/dir2/a.txt
- mv -n dir1/dir2/a.txt dir1/ ==> "n" prevent to overides files if the files already exist. "n" means new

- $ touch dir1/dir2/b.txt
- $ mv -u dir1/b.txt dir1/dir2/
- $ tree dir1/

Renaming with mv:

- $ mv dir1/a.txt dir1/abc.txt
- $ tree dir1/

- $ mv dir1/ dir10
- ls

Rename and move at the same time:

- $ mv dir10/c.txt dir10/dir2/cc.txt
- $ tree dir10/

## 42. Removing Files and Directories (rm, shred)
there is no bin or trash to recover the deleted file using the command "rm"

--> removing files
- $ rm dir10/abc.txt dir10/dir2/a.txt
- $ tree dir10/

- $ rm -i dir10/dir2/b.txt
- $ rm -v dir10/b.txt

--> removing directories
- rm -r dir10
- rm -rf Musicc/ Picturess/ force removal an not recieve a prompt

- $ echo *.txt ==> Use it before deleting to see what exactly you're deliting.

--> shred (used to overide a file before deleting)
- $ shred -vu -n 100 passwd
    - "v", means verbose
    - "u", means remove a file after overwritint it
    - "-n 100", overides the files 100 times (the default is 3)
