# Section 15: Software Management

## 116. DPKG (Debian and Ubuntu Based Distros)

- Download Google Chrome package

- $ cd Download/
- $ ls -l
- $ dpkg --info google-chrome-stable_current_amd64.deb ==> it display information about the packages

- $ sudo dpkg -i google-chrome-stable_current_amd64.deb
- $ dpkg --get-selections ==> To get a list of all installed packages
- $ dpkg-query -l ==> This show also the versions and more info about the packages

- $ dpkg-query -l | grep chrome ==> To filter by chrome (find the complete name of the package there)
- $ dpkg -L google-chrome-stable ==> TO see all the files from the google package

- $ dpkg-query -l | grep ssh
- $ dpkg -L openssh-server

- $ which -a ls
- $ dpkg -S /bin/ls ==> You will see the package that contain the ls command (coreutils)

- $ dpkg -L coreutils ==> TO see all the files from this package
- $ dpkg -L coreutils | less
- $ sudo dpkg -r google-chrome-stable ==> TO remove an already install old package

- $ sudo dpkg -P google-chrome-stable ==> Removing the application an the configuration file

## 117. Intro to APT

- PPAs ==> Personal Package Archive

## 118. Using APT (Advanced Package Tool)

- $ sudo su
- $ id

- $ apt update ==> To update de package index
- $ apt install apache2

- $ systemctl status nginx
- $ systemctl stop nginx

- $ systemctl start apache2
- $ systemctl status apache2

- $ apt install gparted vlc ==> To install multipla packages 

- $ cd ~/Downloads
- $ sudo apt install ~/Downloads/google-chrome-stable_current_amd64.deb

- $ apt list --upgradable ==> TO list package that are posible to upgrade
- $ sudo apt install python3-apt ==> If already exist it will be a upgrade

- $ audo apt full-upgrade ==> To update all the system
- $ audo apt full-upgrade -y ==> To update all the system. "-y" is to run non interactively 

- $ sudo apt remove apache2 -y 
- $ sudo apt purge apache2 ==> "purge" remove also the configuration files and not only the package. (This don't remove the dependencies)

- $ sudo apt autoremove ==> TO remove unneeded dependencies
- $ ls -l /var/cache/apt/archives ==> The place where ubuntu save all packages in the disk
- $ du -sh /var/cache/apt/archives ==> The place where ubuntu save all packages in the disk

- $ sudo apt clean ==> To clear out the local repo of retrieve package files...
- $ ls -l /var/cache/apt/archives ==> The place where ubuntu save all packages in the disk

- $ apt list  ==> To list all available packages
- $ apt list | wc -l ==> To get the total number of available packages
- $ apt list | grep postfix

- $ apt search "transparent proxy"

- $ apt list --installed ==> All installed packages in the system
- $ apt list --installed | wc -l

- $ apt show apache2
- $ apt show zzuf

- $ sudo apt install synaptic
