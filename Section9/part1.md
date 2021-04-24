# Section 9: Linux File Permissions

## 74. Understanding File Permissions

- $ ls -l /etc/passwd
- -**rw-r--r--** 1 root root 2798 abr  4 15:59 /etc/passwd
- in the line above, the bold part represent the file permision
- **rw-** ==> show the owner permisions
- **r--** ==> show the group permisions
- **r--** ==> show everybody else permisions

**INTERPRETATION OF THE LETTERS:**
- "-" ==> absent of permision
- "r" ==> give read permision
- "w" ==> give write permision
- "x" ==> give execute permision

- $ who -a
- $ who -a > users.txt
- $ ls -l users.txt

- $ chmod u-r users.txt ==> take out the read permision for the user
- $ ls -l users.txt
- $ cat users.txt ==> I don't have permision to do this
- $ less users.txt ==> I don't have permision to do this

- $ id > users.txt ==> user still have write permision

- $ chmod u-w users.txt ==> remote write permision
- $ ls -l users.txt
- $ who > users.txt ==> you can do this anymore
- $ cat users.txt ==> you can do this anymore

- $ sudo su
- $ id
- $ ifconfig > interfaces.txt
- $ chmod 000 interfaces.txt  ==> removing all files permisions
- $ cat interfaces.txt ==> root can see the file content


## 75. Octal (Numeric) Notation of File Permissions

- $ ls -l  ==> see permisions in symbolic notation
- $ stat /etc/passwd ==> see permision in Octal/Numeric notation or base-8 notation and in symbolik one

**Octal/Numeric notation**
- 0 ==> No permissions
- 1 ==> Execute
- 2 ==> write
- 3 ==> Write and execute (sum of 1 + 2)
- 4 ==> Read 
- 5 ==> Read and execute (sum of 4 + 1)
- 6 ==> Read and write (sum of 5 + 2)
- 6 ==> Read, write and execute (sum of 5 + 2 + 1)

**Example:**
rw-rw-r-- = 4+2+0 0+4+2 0+4+0 = 664
rwxr---wx = 4+2+1 4+0+0 0+2+1 = 743
rwxr-xr-- = 4+2+1 4+0+1 4+0+0 = 754


## 76. Changing File Permissions (chmod)

- $ who > user.txt
- $ cat user.txt
- $ ls -l user.txt

- $ chmod u-w user.txt ==> remove write permision of user
- $ ls -l user.txt
- $ chmod u+rwx user.txt ==> add read,write,execute permision of user
- $ ls -l user.txt

- $ chmod -v u-x,g+w,o-rwx user.txt
- "g" ==> is for group
- "u" ==> is for user
- "o" ==> is for others
- "-v" ==> just display a message of the acction
- $ ls -l user.txt

- $ chmod ug-r,u+x,o-rwx user.txt
- "-" ==> remove permision
- "+" ==> add permision
- $ ls -l user.txt

- $ chmod a+r,a-wx uset.txt ==> "a" takes out the current permision a set the new ones

- $ chmod ug=rw,o= user.txt
- "=" ==> give permision

**ABSOLUTE CHANGING MODE**

- $ chmod 644 user.txt ==> read,write permision for user, read for others
- $ ls -l user.txt

- $ chmod 777 user.txt ==> read,write,execute for everybody
- $ ls -l user.txt

- $ chmod 400 user.txt
- $ ls -l user.txt

**CHANGING MULTIPLE FILES INDSIDE A DIRECTORY**

- $ mkdir -p dir1/dir2
- $ touch dir1/a dir1/dir2/b dir1/dir2/c
- $ tree dir1/

- $ ls -lR dir1/ ==> "R" display the directory recursively

- $ chmod -R 750 dir1/
- $ ls -lR dir1/ 

- $ ifconfig > inter.txt
- $ ls -l inter.txt user.txt
- $ chmod --reference=inter.txt user.txt ==> set user.txt to have the same permition as inter.txt

- $ ls -l inter.txt user.txt

## 77. The Effect of Permissions on Directories

- $ ls -l

- $ mkdir -p linux/ubuntu
- $ who -a > linux/ubuntu/users.txt
- $ tree linux/

- $ chmod 400 linux/
- $ ls -ld linux/ ==> "d" gives info about the directory and not about his content
- $ ls -l linux/
- cd linux/ ==> I'm not allowed to enter
- rm -rf linux/users.txt ==> I'm not allowed to enter

- $ alias
- $ \ls linux

- $ chmod 600 linux/
- $ ls -ld linux/
- $ ls -l linux/
- $ ls linux/
- $ cd linux/
- $ rm linux/users.txt
- $ touch linux/a.txt

- $ chmod 700 linux/ ==> now you will be able to do anything

- $ ls -l linux/
- $ chmod 000 linux/a.txt
- $ ls -l linux/

- $ rm linux/a.txt ==> permision of parent directory are more important than the file permision, so this will work fine.

## 78. Combining Find and Chmod Commands Together

- $ find ~ -type f ==> "f" is for files
- $ find ~ -type f -exec chmod 640 {} \; ==> change permision of all the files
- $ find ~ -type d -exec chmod 750 {} \; ==> change permision of all the directories

- $ find ~-type f -ls
- $ find ~-type d -ls

## 79. Changing File Ownership (chown, chgrp)

- $ lscpu ==> gives information about the cpu
- $ lscpu > cpu.txt
- $ ls -l cpu.txt

- $ tail /etc/passwd

- $ chown toor cpu.txt ==> a normal user can't do that
- $ sudo chown toor cpu.txt ==> now it will work. This change the user ownership
- $ groups toor

- $ sudo chown toor cpu.txt interfaces.txt inter.txt linu/ ==> change ownership of diferent files

- $ sudo chown +1005 cpu.txt ==> change ownership using the userID
- $ ls -l cpu.txt

- $ sudo chown student:deamon cpu.txt ==> change the owner and the group at the same time
- $ ls -l cpu.txt

- $ sudo chown student.deamon cpu.txt
- $ ls -l cpu.txt

- $ sudo chgrp sudo cpu.txt
- $ ls -l cpu.txt

- $ sudo chown :sudo cpu.txt
- $ ls -l cpu.txt

- $ sudo chown -R student:student ~










