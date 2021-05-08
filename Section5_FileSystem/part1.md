# Section 5: The Linux File System

## 25. Intro to The Linux Files System

- $ df -h ==> To see the mount point (You can find your USB there for example)

- $ ls /

## 26. The Filesystem Hierarchy Standard (FHS)

Press [Alt Gr + 4] to get ~ in Linux

- $ ls /
- $ ls ~ <==> ls /home/rickdevops
- $ ls /root/
- $ cat /proc/cpuinfo
- $ cat /proc/meminfo

## 27. Absolute vs. Relative Paths. Walking through the File System (pwd, cd, tree)
--> Explore
- $ cd     ==> changing the current directory to user's home directory
- $ cd ~    # => changing the current directory to user's home directory
- $ cd -    # => changing the current directory to the last directory
- $ .        ==> the current working directory
- $ ..       ==> the parent directory
- $ ~        ==> the user's home directory
- $ pwd ==> Print Working Directory
- $ ls

Exemple of absolute Path (start with "/")
- /var/log
- /etc/

Exemple of relative Path (start without "/")

- $ cat hosts
- $ cat ./hosts
- $ ls cron.daily/

- $ ls .. ==> list content of the parent directory
- $ ls ../..

--> install tree command
- $ sudo apt install tree
- $ tree

- $ man tree
- $ tree -d /etc ==> prints only directories
- $ tree -df /etc ==> prints absolute path

## 29. The LS Command In Depth (ls)

- $ ls --help
- $ man ls
- $ ls
- $ ls -1 /etc ==> List all the files in one line
- $ ls /etc/ /var/ ==> you can specify more than one argument
- $ ls /etc/ /var/ . 
- $ ls -l
- $ ls -l /etc/
- $ ls -ld /etc/ ==> Just display information about etc directory

--> MEANING OF THE DIRECTORIES

drwxr-xr-x  14 root root      4096 jul 31  2020 var
lrwxrwxrwx   1 root root         8 feb  4 15:34 sbin -> usr/sbin
drwxr-xr-x   8 root root      4096 feb  4 16:58 snap

- Posible First caracters: "-", "d", "l" (Indicates the file types)
    + "-" ==> means a Normal file
    + "d" ==> means a directory
    + "d" ==> symbolic link (its a shortcut)
    + "b" ==> indicates block devices
    + "c" ==> indicates chart devices
    + "s" ==> indicates socket
    + "p" ==> indicates name pipe
- Next 9 caracters: "w", "r", "x", "-", and more (Indicates the file permisions)
    + "w" ==> permision to write
    + "r" ==> permision to read
- Next number (14, 1, 8), is the number of hardlinks
- Next column (root) is the name of the owner the file
- Next column (root) is the name of the group owner of the file
- Next column (4096, 8), is the size of the file (**not real size!, is the size of inodes tructure**)
- Next column (jul 31  2020) is the modification time

- $ ls -lh ==> this show the file size in human readable format
- $ ls -al ==> show hidden files and directories
- $ ls -lS ==> Sort by size
- du ==> stand for disk usage (yo need root privileges)
- du -sh /etc/ ==> to see the real size of the directories
- ls -l -X /etc/ ==> to sort by extension

- ls --hide=*.conf /etc/ ==> list without showing the files with the .conf extension
- ls -l --hide=*.conf /etc/
- ls -lR /etc/ ==> List Recursively (list files in each subdirectories)
- type ls
- \ls ==> list but without colors

## 31. Understanding File Timestamps: atime, mtime, ctime (stat, touch, date)

- $ ls
- $ stat /etc/passwd ==> show statistics about the file
- $ ls -l /etc/
- $ ls -lt /etc/ ==> show a list of directories with the modificaction time
- $ ls -lu /etc/ ==> show a list of directories with the access time
- $ ls -lc /etc/ ==> to see the change time
- $ ls -l --full-time /etc/ ==> this show the full time
- $ pwd ==> show content of the current directory

--> Updating time of a file
- $ touch linux.txt
- $ ls -l linnux.txt ==> look for the modification time
- $ stat linux.txt
- $ touch "learning linux.txt" ==> to write files with white space

- $ touch linux.txt
- $ stat linux.txt
- $ touch -a linux.txt ==> change only the access timestamp
- $ stat linux.txt

- $ touch -m linux.txt ==> change only the modification timestamp
- $ stat linux.txt

- $ date

- $ touch -m -t 201812301430.45 linux.txt
- $ stat linux.txt

- $ touch -d "2010-10-31 15:45:45" linux.txt
- $ stat linux.txt

--> Set the timestamp of a file to the same value to another one file

- $ touch ubuntu.txt
- $ touch linux.txt -r ubuntu.txt
- $ stat linux.txt
- $ stat ubuntu.txt

--> EXPLORE
- $ date
- $ date -u
- $ man date

## 32. Sorting Files by Timestamp
- $ ls -l ==> Sort by name and alphabetic order
- $ ls -lt ==> Sort by modification files. Newest files come first
- $ ls -ltu ==> Sorting and showing by access time
- $ ls -lu ==> Show the access file and sort by name. Alphabetic order
- $ ls -lu -r <==> $ ls -lu --reverse ==> The "-r" just reverse the order
- $ ls -ltur <==> $ ls -ltu --reverse


## 33. File Types in Linux (ls -F, file)

- $ file Desktop/linux.jpeg ==> gives info about a file
- $ mv ~/Desktop/linux.jpeg ~/Desktep/linux.png
- $ file Desktop/linux.png ==> gives info about a file

See example of a block device
- ls -l /dev/sda1

See example of a chart device
- ls -l /dev/

See example of a socket
- ls -l /run/

Another way of classifying files
- $ ls -F ==> Give info of the type of file at the end of the name
- $ ls -F /etc/

- symbols at the en of a file:
    - "@" ==> Indicates symbolic links
    - "=" ==> Indicates socket
    - "/" ==> directory
    - "|" ==> name pipe

If this is cofusing, you can figure out the file type using the command "file"
- file /etc/vtrgb ==> give info about the file
- file run/* ==> gives info of all of the files inside run directory
