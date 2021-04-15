# Section 13: Networking on Linux

## 105. Securing the OpenSSH Server (sshd)

- $ ls -l /etc/ssh ==> THe server configuration file

- $ cp /etc/ssh/sshd_config /etc/ssh/copy_sshd_config

- $ sudo vim /etc/ssh/sshd_config

- $ man sshd_config
- /AllowUser

- $ iptables -A INPUT -p tcp --DPORT 22 -S 2.2.4.5 -J ACCEPT
- $ iptables -A INPUT -p tcp --DPORT 22 -S 2.2.4.5 -J DROP

## 107. Copying Files Over the Network (scp)

- $ man scp


- $ ssh -vv rickdevops@192.168.1.108

- $ sudo tail -f /var/log/auth.log

- $ ip add show > ip_home.txt

- $ scp -P 22 Section8/docs/SSH.pdf rickdevops@192.168.1.108:~ ==> Coping files between machines
- $ scp -P 22 Section8/docs/SSH.pdf rickdevops@192.168.1.108:~/ssh_newName.pdf ==> Coping files between machines with new name

- $ diff SSH.pdf ssh_newNames.pdf ==> TO see if the new files are the same

- **Moving a directory**

- $ mkdir mydir1
- $ mv SSH.pdf mydir1/
- $ ls mydir1/

- $ scp -r -P 22 mydir1/ rickdevops@192.168.1.108:~ ==> Coping files between machines
- $ scp -rp -P 22 mydir1/ rickdevops@192.168.1.108:~ ==> Coping files between machines. "p" preserve the modification and access time

- **Coping to your machine**
- $ scp rickdevops@192.168.1.108:/etc/passwd . ==> To copy files
- $ scp rickdevops@192.168.1.108:~/Desktop/mydir1 . ==> To copy directories

- $ scp user@IP1:/path_to_source_file user2@IP2:/path_to_destination_dir


## 108. Synchronizing Files and Directories using rsync

- $ man rsync

- $ sudo rsync -av /etc/ ~/etc-backup/
- $ sudo rsync -aq /etc/ ~/etc-backup/

- $ sudo rsync -av --delete /etc/ ~/etc-backup/ ==> for mirroring


- $ vim exclude_files.txt
"""
movie1.mkv
dir1/
*.png

"""

- $ rsync -av --exclude-from='./exclude_files.txt' my_project/ backup/
- $ rsync -av --exclude-from='/~/exclude_files.txt' ~/my_project/ ~/backup/
- $ tree backup

- $ rsync -av --exclude='*.png' my_project/ backup/
- $ rm -rf backup/
- $ rsync -av --exclude='*.png' --exclude='a.pdf' my_project/ backup/

## 109. Using rsync Over the Network

**Centos Machine**

- $ sudo rsync -av -e ssh /etc/ rickdevops@192.168.1.108:~/etc-centos/
- $ sudo groupadd devops
- $ sudo touch /etc/test-file
- $ sudo rsync -av -e ssh /etc/ rickdevops@192.168.1.108:~/etc-centos/ ==> only copy the newfile to destination

- $ sudo rm /etc/test-file
- $ sudo rsync -av -e ssh /etc/ rickdevops@192.168.1.108:~/etc-centos/ ==> It will not delete the file!!

- $ sudo rsync -av -e ssh --delete /etc/ rickdevops@192.168.1.108:~/etc-centos/ ==> Now it will work, file will be deleted in destination

- $ sudo rsync -av -e 'ssh -p 22' --delete /etc/ rickdevops@192.168.1.108:~/etc-centos/ ==> This syntax allow to especify another port


- $ sudo rsync -av -e ssh rickdevops@192.168.1.108:~/mydir1 ==> You will see a new file in the Centos machine

