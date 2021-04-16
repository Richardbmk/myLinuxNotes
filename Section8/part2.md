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

## 111. Using wget

- man wget ==> is for download files
- sudo apt install wget

- $ sudo wget https://cdimage.kali.org/kali-2021.1/kali-linux-2021.1-installer-amd64.iso

- $ mkdir kali
- $ wget -P kali/ https://cdimage.kali.org/kali-2021.1/kali-linux-2021.1-installer-amd64.iso ==> download the file in a different path

- $ wget --limit-rate=100k -P kali/ https://cdimage.kali.org/kali-2021.1/kali-linux-2021.1-installer-amd64.iso ==> to put some limit to the download

- $ wget -c -P kali/ https://cdimage.kali.org/kali-2021.1/kali-linux-2021.1-installer-amd64.iso ==> The download will continue from where it was left becouse of "c".

- $ vim images.txt
"""
https://images-na.ssl-images-amazon.com/images/I/41YBgn9CiJL._SX324_BO1,204,203,200_.jpg
https://images-na.ssl-images-amazon.com/images/I/61ydSUheYOL._SX383_BO1,204,203,200_.jpg
https://m.media-amazon.com/images/I/41Gf-eu+AJL._SX260_.jpg

"""

- $ wget -i images.txt ==> download from a file

- $ wget -c -P kali/ https://cdimage.kali.org/kali-2021.1/kali-linux-2021.1-installer-amd64.iso ==> "b" is for download in the background
- $ tail -f wget-log ==> To se the progress of the download
- $ CRTL + C ==> stop the process
- $ pkill wget ==> Killing the process

- $ nohup wget -c -P kali/ https://cdimage.kali.org/kali-2021.1/kali-linux-2021.1-installer-amd64.iso ==> "b" is for download in the background

- $ wget --mirror --convert-links --adjust-extension --page-extension --page-requisites --no-parent http://example.org ==> here you are downloading a webpage to view it witouth internet

## 112. Checking for Listening Ports (netstat, ss, lsof, telnet, nmap)

- $ sudo netstat -tupan ==> Display all open ports
- $ man netstat

- "-tupan" ==> to show TCP ports
- "-upan" ==> show UDP ports

- $ sudo netstat -tupan | grep :22 ==> To see if a port is open
- $ sudo netstat -tupan | grep :80 ==> No output means the port is close
- $ sudo netstat -tupan | grep sshd

- $ sudo apt install nginx ==> Installin nginx web server
- $ sudo systemctl status nginx

- $ sudo netstat -tupan | grep :80 ==> The port will be open because we have nginx

- $ ss -tupan ==> "ss" means Socket Statistics. Do the seam as netstat
- $ lsof ==> list open file

- $ lsof -u rickdevops ==> Files open by a user

- $ sudo lsof -u root

- $ sudo lsof -u ^root ==> "^" is a negation. Files are not open by root
- $ sudo lsof -c nginx ==> files open by nginx

- $ sudo lsof -iTCP -sTCP:LISTEN ==> files which have open TCP ports
- $ sudo lsof -iTCP -sTCP:LISTEN -nP ==> files which have open TCP ports

- $ sudo lsof -iTCP:22 -sTCP:LISTEN -nP 

- $ telnet 192.168.1.108 22 ==> To se is a port is open in another machine

- $ telnet google.com 443 ==> This is open
- $ telnet google.com 22 ==> This is close

- $ sudo apt install nmap ==> It is a professional network scanner
- $ sudo nmap 192.168.1.108 22 ==> another way to look if the port is open
- $ sudo nmap 80 linux.com -sV



