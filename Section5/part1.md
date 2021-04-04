# Section 7: User Account Management

## 65. Understanding passwd and shadow files

- $ ls -l /etc/passwd /etc/shadow

- $ less -l /etc/passwd ==> contain basic information of each user account in the system

- $ less -l /etc/shadow ==> it store the actual user password in an encrypted format. 

- $ man shadow

- $ useradd user1 ==> create a new user
- $ passwd user1 ==> create new password for the user

- $ useradd user2 ==> create a new user
- $ passwd user2 ==> create new password for the user

- $ tail /etc/shadow

## 66. Understanding Linux Groups (groups, id)

- $ touch abc.txt
- $ ls -l abc.txt

- $ grep root /etc/passwd
root:x:0:0:root:/root:/bin/bash
0 ==> User ID
0 ==> Group ID

- $ grep 0 /etc/group

- $ less /etc/group
- $ groups ==> list of all groups the user belongs to

- $ groups rickdevops
- $ groups root

- $ id ==> prints info about the user, groups, ids and more

## 67. Creating User Accounts (useradd)

- $ man useradd

- $ sudo useradd user3
- $ tail -n 5 /etc/passwd

- $ less /etc/default/useradd

- $ groups u1 ==> list the groups this user belongs

- $ less /etc/login.defs

- $ sudo passwd user3 ==> you need to set the password to login as the new user

- $ sudo useradd -m -d /home/james -c "C++ Developer" -s /bin/bash -G sudo,adm,mail james ==> this create user home directory, the "c" is for adding comments, the "s" add bash shell as a default, the "G" add secundary groups to the user

- $ sudo useradd -r 2022-12-31 user4 ==> this create a user with expiration date

- $ chage -l james
- $ chage -l user4 ==> you can see the expiration date

- $ less /etc/passwd


## 68. Changing and Removing User Accounts (usermod, userdel)

To find info about user:
- $ less /etc/passwd
- $ sudo less /etc/shadow
- $ less /etc/group
- $ sudo less /etc/gshadow
- $ less /etc/login.defs

- $ man usermod

- $ sudo usermod -c "Golang developer" james ==> Change the comment of an existing user.
- $ grep james /etc/passwd

- $ sudo usermod -g deamon james ==> to change the primary group of an user

- $ groups james

- $ sudo groupadd developers ==> adding new group
- $ sudo groupadd managers ==> adding new group

- $ sudo usermod -G developers,managers james ==> adding james to the new created groups (Now james belong **only** to this new groups)
- $ groups james

- $ sudo usermod -aG sudo james ==> adding jame to the sudo group. (Now james belong to the sudo groun and more groups)
- $ groups james

- $ less /etc/passwd
- $ sudo userdel user4 ==> this delete user4
- $ sudo userdel -r user4 ==> this delete user4 and his home directory
- $ grep james /etc/passwd
- $ ls /home/

## 69. Creating Admin Users

- $ sudo useradd -m -s /bin/bash toor
- $ grep toor /etc/passwd

- $ sudo passwd toor
- $ su toor ==> becoming toor user
- $ id

- $ cat /etc/passwd ==> user toor can't do anything ralated with Admin task
- $ sudo cat /etc/passwd ==> anything ralated with Admin task

- $ id

- $ sudo usermod -aG sudo toor ==> this give Admin permision
- $ su toor

- $ sudo cat /etc/passwd ==> works fine!

## 70. Group Management (groupadd, groupdel, groupmod)

- $ sudo groupadd engineering
- $ tail -3 /etc/group
- $ cat -3 /etc/group

- $ sudo useradd u1
- $ sudo useradd -G engineering u2
- $ groups u3

- $ sudo usermod -aG engineering u1
- $ groups u1

- $ sudo groupmod -n engineers engineering ==> changind the name of an existing group
- $ groups u1
- $ sudo groupdel engineers

## 71. User Account Monitoring (whoami, who am i, who, id, w, uptime, last)

- Real User ID = RUID
- Efective User ID = EUID

- rickdevops i sthe RUID
- $ sudo su ==> EUID becomes root user

- $ whoami <==> $ id -un
- $ who ==> Display the name of RUID
- $ id ==> prints the efective user and its groups

- $ sudo cat /var/run/utmp ==> file that logs current user on the system
- $ sudo cat /var/log/wtmp ==> histoy of utmp file
- $ ls -l /var/log/wtmp
- $ who

- $ sudo apt install openssh-server
- $ sudo systemctl status ssh
- $ ifconfig
- $ who -H
- $ who -aH
- $ w

- $ uptime
- $ last ==> track user activities. list of last login user
- $ last student ==> just give info of student
- $ man last






