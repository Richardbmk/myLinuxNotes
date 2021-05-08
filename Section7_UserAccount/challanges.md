# Secction 8: Challenges - User Account Management

## Challenges - User Account Management

#### Challenge #1

1. Create a new user using the useradd command with no other options. Check if the home directory of the user was created as well.

- $ sudo useradd richard
- $ ls -l /home/

2. Set a password for the user.

- $ passwd richard

3. Log in as the new user (in a terminal or GUI).

- $ su richard
- $ id


#### Challenge #2

1. Create a new user using the useradd specifying the following: the home directory (which will be created as well), the Bash shell and a comment.

- $ sudo useradd -m -d /home/rick -s /bin/bash -c 'rick@gmail.com' rick
- $ ls /home/

2. Set a password for the user.

- $ sudo passwd rick

3. Create a new group using the groupadd command and then add the user to the newly created group.

- $ sudo groupadd engineer
- $ usermod -aG engineer rick

4. Check the groups to which the user belongs

- $ groups rick

#### Challenge #3

1. Try to execute a command as root (like say sudo cat /etc/shadow or sudo ls -l /root). Run the command as the user created at the previous challenge. Notice what will happen.

- $ sudo cat /etc/shadow
- $ sudo ls -l /root

- $ su rick
- $ id
- $ sudo cat /etc/shadow ==> will not work
- $ sudo ls -l /root ==> will not work

2. Make this user an admin one and rerun the command as root.

- $ sudo usermod -aG sudo rick
- $ groups paul

- $ su rick
- $ id
- $ sudo cat /etc/shadow ==> work
- $ sudo ls -l /root ==> work

#### Challenge #4

1. Create 2 new groups and add the user from the previous challenge to those groups without taking it out of the groups it already belongs to.

- $ sudo groupadd operation
- $ sudo groupadd development

- $ tail /etc/group

- $ sudo usermod -aG operation,development rick
- $ groups rick
- $ grep operation /etc/group

#### Challenge #5

1. Remove the groups and the users (including their home directory) created in the previous challenges.

-  $ tail /etc/group
-  $ tail /etc/passwd

- $ sudo userdel -r rick ==> delete with home directory
- $ sudo groupdel operation
- $ sudo groupdel development

#### Challenge #6

1. Understand the concept of salt used in Linux passwords. Create 2 new users and set the same password for both of them. Check that the save password in /etc/shadow is different for each user.

- $ sudo useradd user1
- $ sudo passwd user1

- $ sudo useradd user2
- $ sudo passwd user2

- $ sudo tail -n 2 /etc/shadow




