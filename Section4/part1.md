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
    + "-" ==> means a Normal directory
    + "d" ==> means a directory
    + "d" ==> symbolic link (its a shortcut)
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
