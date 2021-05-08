# Secction 16: Challenges - Software Management

## Challenges - dpkg, apt

#### Challenge #1

1. Download the Google Earth package (.deb) for Ubuntu from this address: https://www.google.com/intl/en_in/earth/versions/

Do it manually going to the home page

2. Install the app using the locally downloaded .deb file and dpkg

- $ sudo dpkg -i google-earth-stable_current_amd64.deb

3. Start the application.

just open the google chome

## Challenge #2

1. Remove the Google Earth application using dpkg

- $ dpkg-query -l | grep earth
- $ sudo dpkg -r google-earth-stable_current_amd64.deb ==> Just the app
- $ sudo dpkg -P google-earth-stable_current_amd64.deb ==> Te app and files

2. Install Google Earth again using apt and the deb file.

- $ sudo apt install ./google-earth-stable_current_amd64.deb

## Challenge #3

1. Display all installed applications using dpkg

- $ dpkg-query -l
- $ dpkg --get-selections

2. Take any linux command and check to which package it belongs.

- $ which -a ls
- $ dpkg -S /bin/ls

3. List all other files from that package

- $ dpkg-query -L | grep coreutils

## Challenge #4

1. Install the nginx web server using apt.

- $ sudo apt update && sudo apt install nginx

2. Start and check the service by connecting to localhost using the browser.

- $ systemctl start nginx

3. Remove the web server.

- $ sudo apt purge nginx -y ==> Is better to use purge!!

## Challenge #5

1. Search for a package named squid in the official repositories and display information about it.

- $ apt list | grep squid
- $ apt show squid


## Challenge #6

1. List all upgradable applications.

- $ sudo apt list --upgradable

2. Upgrade all applications assuming yes to each prompt.

- $ sudo apt full-upgrade -y