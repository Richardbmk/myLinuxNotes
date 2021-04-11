# Section 20: Bash Shell Scripting

## 153. Variables in Bash

- $ os=Linux
- $ distro="MX Linux"
- $ age=27
- $ server_name="Apache 2.4"

- $ echo $os
- $ echo $distro
- $ echo $age
- $ echo "Here from the past. Currently $age old." ==> you must use doble quotes

- $ echo "The value of \$os is $os"

- $ distro="Ubuntu"
- $ my_distro="$os $distro"

- $ set ==> get a list of all shell variables and function
- $ set | grep distro

- $ echo $distro
- $ unset distro ==> to remove or undefine a variable
- $ echo $distro ==> is empty

#### **SHELL VARIABLE:**

- $ echo $USER
- $ echo $HOME
- $ echo $HISTFILE
- $ echo $HISTSIZE

#### **READ ONLY VARIABLES**

- $ declare -r logdir="/var/log" ==> this is an read only variable
- $ ls $logdir ==> you can set or delete a read only variable
- $ logdir=abc ==> will not work
- $ unset logdir ==> will not work

#### **SCRIPTS WITH VARIABLES**

## 154. Environment Variables

- $ ECHO $PATH
- $ echo $HOME
- $ env ==> view all env variables
- $ env | less
- $ env | grep SHELL

- $ printenv ==> print all env variable
- $ printev HOME ==> Print the valua of the home variable
- $ printenv SHELL PWD LC_TIME

- $ set ==> show variables created by the user. Print set function

- $ set -o posix ==> do not show the functions
- $ set | less

- $ pwd

- $ vim ~/.bashrc
  - write: export PATH=~/Desktop/shell-scripts
  - Doing this allow to run a command without ./myscript.sh
- $ source ~/.bashrc

system wide variable for every user in the machine:

- $ vim ~/.bashrc OR $ vim /eyc/profile

  - write: export MYVAR=342
  - Doing this allow to run a command without ./myscript.sh

- $ ls -l /etc/environment

## 155. Getting User Input

- $ read name
  Rick
- $ echo $name

- $ read -p "Enter the IP address" ip
- $ echo $ip
- $ ping -c 1 $ip

- $ ping 8.8.8.8
- $ sudo iptable -I INPUT -s 8.8.8.8 -j DROP
- $ ping 8.8.8.8

- $ vim block_ip.sh

- $ read -s -p "Enter password:" pswd ==> enter a password without showing anything

## 156. Special Variables and Positional Arguments

- $ cat arguments.sh
- $ ./arguments.sh
- $ ./arguments.sh linux windows mac 10
- $ ./arguments.sh

- $ vim display_and_compress.sh

- $ cp block_ip.sh drop_ip.sh

## 165. For Loops

FIND CODE IN THE SCRIPS FOLDER

## 167. While Loops

FIND CODE IN THE SCRIPS FOLDER

- $ a=6
- $ b=7
- $ c=$((a+b)) ==> you must use double parentesis
- $ echo $c

- $ let d=a+b
- $ echo $d

- $ sudo apt install openssh-server
- $ sudo systemctl status ssh
- $ sudo systemctl start ssh
- $ sudo systemctl stop ssh

**WRITE DIRECTLY IN THE TERMINAL**

- $ while true; do echo "infinite loop"; sleep 1; done
- $ for n in {5..10..2};do echo "$n";done

## 168. Case Statement

FIND CODE IN THE SCRIPS FOLDER

## 169. Functions in Bash

FIND CODE IN THE SCRIPS FOLDER

## 170. Variable Scope in Functions


