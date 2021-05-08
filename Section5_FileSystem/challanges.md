# Secction 6: Challenges - The Linux File System

## Challenges - Paths, LS, File Timestamps and Types, Viewing Files

#### Challenge #5

2. Rerun the previous command adding an option that omits the files that ends in .log from listing.

- $ ls -lSh --hide=*log /var/log

3. List the contents of /etc recursively.

- $ ls -lR /var/log

#### Challenge #6

1. Create a new file called linux.txt in the user’s home directory using the touch command.

- $ touch linux.txt

2. Notice the file timestamps using both stat and ls commands.

- $ stat linux.txt
- $ ls -l linux.txt

3. Display the entire timestamp of the file using the ls command.

- $ ls -lu linux.txt
- $ ls -lc linux.txt
- $ ls -l --full-time linux.txt

#### Challenge #7

1. Consider the file created in the previous challenge. Notice its timestamps and then update them to the system current date and time.

- $ ls -l linux.txt
- $ stat linux.txt

2. Change only the modification and change time to the current system time. See the change.

- $ touch -m linux.txt
- $ stat linux.txt

3. Change only the modification time manually to 1990, January 15, 10:30:55 AM.

- $ touch -m -t 199001151030.55 linux.txt
- $ stat linux.txt

#### Challenge #8

1. Consider the file called linux.txt created in the previous challenge. Notice its timestamps and then update them to the values of /etc/passwd. See the changes.

- $ ls
- $ stat linux.txt
- $ touch -r /etc/passwd linux.txt
- $ stat linux.txt

#### Challenge #9

List the contents of /var/log displaying the access time of the files and sorting by file names in reverse order.

- $ ls -lu --reverse /var/log/

#### Challenge #10

Notice and try to recognize all Linux file types by running ls -l, ls -F and file commands.

Run the commands on the following files:

/etc/passwd

- $ ls -l /etc/passwd
- $ ls -lF /etc/passwd
- $ file /etc/passwd

#### Challenge #11

List the contents of /var/log/dmesg using the cat command and displaying the line numbers as well.

- $ cat -n /var/log/dmseg

#### Challenge #12

1. Display the contents of /etc/ssh/ssh_config page by page using less.

- $ less /etc/ssh/ssh_config

2. Go to the end and then to the beginning of the file using the right shortcuts.

- press g (BEGINNING)
- press SHIFT + g (END)

3. Search forward for the string Ciphers

- /Ciphers

4. Quit less

- press q

#### Challenge #13

1. Display the first 3 lines of /etc/passwd

- $ head -3 /etc/passwd
- $ head -n 3 /etc/passwd

2. Display the last 5 lines of /etc/shadow

- $ sudo tail -5 /etc/shadow
- $ sudo tail -n 5 /etc/shadow

3. Display the contents of /etc/group starting with line 5

- $ tail -n +5 /etc/group


#### Challenge #14

1. Display the last 12 lines of /var/log/auth.log in real-time.

- $ tail -n 12 -f /var/log/auth.log

2. Become root in another terminal and notice how the display is automatically updated.

#### Challenge #15

1. Display the contents of the user’s home directory repeatedly every 2 seconds.

- $ watch -d -n 2 ls

2. Create a new file in the user's home directory and notice the differences between the refreshes.


## Challenges - cp, mv, rm, shred

#### Challenge #1

1. Install the tree command which is necessary.

2. Using shell commands create the following directory structure.

home/rickdevops/linux
├── centos
│   ├── commands.txt
│   ├── security.txt
│   └── updates
│       └── latest
└── ubuntu
    └── apt.txt

#### Challenge #2

1. Considering this directory structure, copy the file called security.txt to the updates directory.

- $ cp linux/centos/security.txt linux/centos/updates/
- $ tree ~/linux

#### Challenge #3

Considering the solution from the previous challenge remove the file called security.txt from the directory called updates.

- $ rm ~/linux/centos/updates/security.txt
- $ tree ~/linux

#### Challenge #4

Considering the initial directory structure, copy the directory called updates from centos to ubuntu.

- $ cp -r ~/linux/centos/updates/ ~/linux/ubuntu/

#### Challenge #5

Considering the solution from the previous challenge, remove the directory called updates from ubuntu directory.

- $ rm -r ~/linux/ubuntu/updates/
- $ tree ~/linux

#### Challenge #6

Considering the initial directory structure and using only one command copy the file called apt.txt and the directory called updates to linux directory.

- $ cp -r ~/linux/ubuntu/apt.txt ~/linux/centos/updates/ ~/linux/
- $ tree ~/linux


#### Challenge #7

Considering the solution from the previous challenge remove the file called apt.txt and the directory called updates from the linux directory interactively (by prompting the user).

- $ rm -ir ~/linux/apt.txt ~/linux/updates/
- $ tree ~/linux

#### Challenge #8

Considering the initial directory structure, rename the directory called centos to redhat and then back to centos.

- $ mv linux/centos linux/redhat
- $ tree ~/linux
- $ mv linux/redhat linux/centos
- $ tree ~/linux

#### Challenge #9

Considering the initial directory structure, copy the file called security.txt to ubuntu directory as sec.txt

- $ cp linux/centos/security.txt linux/ubuntu/sec.txt
- $ tree linux

#### Challenge #10

1. Create a file named users.txt by redirecting the output of the who command.

- $ who
- $ who > users.txt

2. Display the file contents.

- $ cat users.txt

3. Remove the file in a secure manner by overwriting the file 50 times before removing.

- $ shred -vu -n 50 users.txt

#### Challenge #11

Remove the entire directory structure without prompting.

- $ rm -rf linux
- $ ls

## Challenges - tar, ln


#### Challenge #1

1. Using tar, create an archive of /etc in the current directory.

- $ sudo tar -cvf etc.tar /etc/ 

2. Display the contents of the archive searching for a specific file in the archive.

- $ tar -tvf etc.tar etc/ | grep passwd

3. Extract the archive in the current directory.

- $ tar -xvf etc.tar

#### Challenge #2

1. Using tar, create a compressed archive of /etc using gzip in the current directory.

- $ tar -czvf archive.tar.gz /etc/

2. Display the contents of the archive searching for a specific file in the archive.

- $ tar -tvf etc.tar etc/ | grep passwd

3. Extract the archive in another directory.

- $ tar -C -xzvf /tmp/ archive.tar.gz
- $ ls /tmp/


#### Challenge #3

1. Create a file using a command redirection and a directory.

- $ ip addr > ip.txt

2. Create 2 hard links to the file. Check the no. of hard links.

- $ mkdir mydir
- $ ln ip.txt i.txt
- $ ln ip.txt mydir/ip.txt
- $ ls -li . mydir/

3. Create a symlink to the initial file. Check the symlink.

- $ ln -s ip.txt ips.txt
- $ ls -l

4. Delete the initial file and and see what happens with the other 2 hard links and with the symlink.

- $ rm ip.txt
- $ cat ips.txt
- $ ls
- $ ls -l i.txt

#### Challenge #4

1. Create a symlink to the Desktop directory in another directory.

- $ ln -s ~/Desktop/ mydir/desk
- $ ls -l mydir/



2. Create a hard link to the Desktop directory in another directory.

- $ ln ~/Desktop/ mydir/desk ==> you can do this, hard link is not allowed for directories

## Challenges - locate, find

#### Challenge #1

1. Check if locate is installed. Install it if necessary.

- $ which locate

2. Create a new file and search for it using locate.

- $ ls > abc123.txt 
- $ locate abc123.txt ==> doen't find anything need to update the locate db


3. Update the database used by locate and search for the file again.

- $ sudo updatedb
- $ locate abc123.txt

#### Challenge #2

1. Remove the file created in the previous challenge.

- rm abc123.txt


2. Search for it using locate.

- $ locate abc123.txt

3. Update the database used by locate and search for the file again.

- $ sudo updatedb
- $ locate abc123.txt

#### Challenge #3

1. Find all regular files in /var that have a size bigger than 2 MB.

- $ sudo find /var/ -type f -size +2M
- $ sudo find /var/ -type f -size +2M -ls

#### Challenge #4

1. Find all regular files in /etc that have been modified in the last hour.

- $ sudo find /etc/ -type f -mmin -60

2. Execute cat on each found file.

- $ sudo find /etc/ -type f -mmin -60 -exec cat {} \;

3. Create a new directory and copy all found files in that directory (backup).

- $ mkdir mydir1
- $ ls
- $ sudo find /etc/ -type f -mmin -60 -exec cp {} mydir1/ \;
- $ ls mydir1/

#### Challenge #5

1. Find all regular files in /var that are not owned by root.

- $ sudo find /var/ -type f -not -user root
- $ sudo find /var/ -type f -not -user root -ls


#### Challenge #6

1. Create a directory and a new file in it.

- $ mkdir dir1
- $ touch dir1/abc.txt
- $ tree dir1/

2. Find all files that have the change time in the last minute in the newly created directory and delete them automatically.

- $ find dir1/ -type f -cmin -1
- $ find dir1/ -type f -cmin -1 -delete
- $ tree dir1/



