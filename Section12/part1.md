# Section 25: [EXTRA] Security: SSH Public Key Authentication

## 200. SSH Public Key Authentication Overview

## 201. Generating SSH Key Pair on Windows

- Use Puttyget and create a Private and a Public key

## 203. Generating SSH Key Pair on Linux

- $ ssh-keygen -b 2048 -t rsa -C "linux user Apr 2021"
    - "-b" ==> Number of beats in the key to create
    - "-t" ==> Type of key to create
    - "-C" ==> It is just a comment
 
- Generate the public and automatic Key

- $ ls -l ~/.ssh/ ==> You will find the keys in this private directory

## 204. Configuring SSH Public Key Authentication on Linux

Look the tutorial!

#### **CONFIGURE YOUR LINUX TO GET ACCESS FROM A WINDOWS MACHINE**

Load the private key in PUTTYgen, and copy the Publick key

- $ ls -l ~/.ssh/
- $ vim ~/.ssh/authorized_keys

- paste the Publick key content in the file

- $ systemctl status ssh ==> Checking if the ssh demon is running on the server

- Configure Putty as you alway do with AWS EC2, to connect to a linux machine

- $ ifconfig ==> To find the ip address

#### **CONFIGURE YOUR LINUX TO GET ACCESS FROM A LINUX MACHINE**

- $ cat ~/.ssh/id_rsa.pub ==> Find the public key of the linux machine
- $ scp -P 22 ~/.ssh/id_rsa.pub linux2@192.168.0.20:~

- $ ssh-copy-id -i ~/.ssh/id_rsa.pub linux2@192.168.0.20 ==> Anothe way to do the same as above

- $ cat id_rsa.pub >> ~/.ssh/authorized_keys ==> Appending new public key to the authorized_keys file

- $ cat  ~/.ssh/authorized_keys ==> You have to see two block of text

- now you will be able to acces the second linux machine!!
- $ ssh linux2@192.168.0.20

- $ chmod 400 ~/.ssh/id_rsa

- $ sudo su

- $ vim /etc/ssh/sshd_config
    - PasswordAuthentication no
- $ systemctl restart ssh

