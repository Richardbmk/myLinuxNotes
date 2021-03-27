# Section 5: The Linux File System

## 25. Intro to The Linux Files System

$ df -h ==> To see the mount point (You can find your USB there for example)

$ ls /

## 26. The Filesystem Hierarchy Standard (FHS)

Press [Alt Gr + 4] to get ~ in Linux

$ ls /
$ ls ~ <==> ls /home/rickdevops
$ ls /root/
$ cat /proc/cpuinfo
$ cat /proc/meminfo

## 27. Absolute vs. Relative Paths. Walking through the File System (pwd, cd, tree)
--> Explore
$ cd     ==> changing the current directory to user's home directory
$ cd ~    # => changing the current directory to user's home directory
$ cd -    # => changing the current directory to the last directory
$ .        ==> the current working directory
$ ..       ==> the parent directory
$ ~        ==> the user's home directory
$ pwd ==> Print Working Directory
$ ls

Exemple of absolute Path (start with "/")
/var/log
/etc/

Exemple of relative Path (start without "/")

$ cat hosts
$ cat ./hosts
$ ls cron.daily/

$ ls .. ==> list content of the parent directory
$ ls ../..

--> install tree command
$ sudo apt install tree
$ tree

$ man tree
$ tree -d /etc ==> prints only directories
$ tree -df /etc ==> prints absolute path