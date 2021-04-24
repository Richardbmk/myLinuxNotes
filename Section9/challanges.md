# Secction 10: Challenges - File Permissions

## Challenges - File Permissions

Create a directory with a regular file in it. Work as a non-privileged user.

- $ mkdir linux
- $ echo "This is Ubuntu" > linux/ubuntu.txt
- $ tree linux/

#### Challenge #1

1. Display the permissions of ubuntu.txt

- $ stat linux/ubuntu.txt
- $ ls -ld linux/ubuntu.txt

2. Remove all permissions of others.

- $ chmod 660 linux/ubuntu.txt <=THE SAME=> $ chmod o-rwx linux/ubuntu.txt
- $ ls -ld linux/ubuntu.txt 

#### Challenge #2

1. Remove the read permission of ubuntu.txt for the owner and check if the owner can read the file.

- $ chmod u-r linux/ubuntu.txt
- $ cat linux/ubuntu.txt

#### Challenge #3

1. Using the octal notation, set the permissions of the directory to rwxrwx--- and of the file to rw-r-----

- $ chmod 770 linux/
- $ chmod 640 linux/ubuntu.txt

#### Challenge #4

1. Set the permissions of the directory to 0667. Check if the user (owner) can list its contents, move to the directory and remove it.

- $ chmod 0667 linux/
- $ ls -ld linux/
- $ ls -l linux/
- $ tree linux/
- $ cd linux/
- $ rm -rf linux/ubuntu.txt

#### Challenge #5

1. Set the permissions of all the files in the user's home directory to 0640 and the permissions of all directories to 0750.

- $ find ~ -type f -exec chmod 0640 {} \;
- $ find ~ -type d -exec chmod 0750 {} \;

#### Challenge #6

1. As a non-privileged user list the contents of /root using the ls command. See what will happen.
- $ id
- $ ls -l /root

2. As root set SUID to ls and list the contents of /root again as a non-privileged user.

- $ which ls
- $ ls -l /usr/bin/ls
- $ sudo chmod 4755 usr/bin/ls
- $ ls -l /usr/bin/ls



3. Check the SUID permission set on ls

- $ ls -la /root/
- $ ls -ld usr/bin/ls


4. As root remove the SUID bit.

- $ id
- $ sudo chmod u-s usr/bin/ls
OR
- $ sudo chmod 0755 usr/bin/ls

#### Challenge #7

1. Set the directory permissions to 0777 and the file permissions to 0000. As another non-privileged user, try to remove the file.

- $ chmod 0777 linux/
- $ chmod 0000 linux/ubuntu.txt

- $ ls -ld linux/
- $ ls -l linux/

- $ id
- $ su rick
- $ rm -rf linux/ubuntu.txt
- $ ls linux/

2. Create a new file in the directory and set its permissions to 0644.

- $ touch linux/newFile
- $ chmod 0644 linux/newFile

3. Set the Sticky Bit on the directory.

- $ sudo chmod 1777 linux/
- $ ls -ld linux/

4. As another non-privileged user, try to remove the file.

- $ id
- $ su Richard
- $ ls linux/
- $ rm -rf linux/newFile

#### Challenge #8

1. Change the owner and the group owner of all files in the current user home directory to the current user and its primary group.

- $ id 
- $ sudo chown -R student:student ~



