# Seccition 3: The Linux Terminal In Depth

## 11. Terminals, Consoles, Shells and Commands

--> Open the Therminal

Crtl + Alt + T

--> Explore commands

$ ip a
$ who
$ ip add
$ ps

 
--> Instalation of another type of gnome-terminal called Terminator
$ sudo su
$ sudo apt update && sudo apt install terminator

## 12. Linux Command Structure

--> Explore commands

this is a way of prove if you have internet conexion.
8.8.8.8 is the public DNS of google

$ ping -c 1 8.8.8.8

loopback interface
$ ping -c 127.0.0.1

--> List content of the current directory
$ ls 
$ ls -l /etc/
$ ls --all
$ ls -a

short options can be join together 

$ ls -l -all -h /var/ <== THE SAME ==> $ ls -lh -all

df --> Display information about the filesystem and the disk space usage.

$ df
$ df -h
$ df -h -i <== THE SAME ==> $ df -hi
$ df -hi -all

## 13. Getting Help, Man Pages (man, type, help, apropos)

--> Using the manual page (man command)
$ man ls
$ h (help to know how to move in manual page)
$ e (next line)
$ y (previous line)
$ g (go to the beggining)
$ G (to the end)
$ q

--> Searching in the manual page (Whe still in the man page)

/something_to_search_for
Exemple:
$ /sort
$ n (navagate between matches) <== THE SAME ==> $ shift + n

--> Search Backwards (Whe still in the man page)

?something_to_search_for 
Example:
?attime

--> Types of commands (executable and built in)

Exemple of executable commands
$ type df
$ type rm
$ type apt

Example of built in
$ type cd
$ type alias
$ type umask

--> manual for buil in commands
$ help cd

$ help alias

--> How to see your IP or Mac address of a network interface

$ ifconfig

If is not installed run
$ apt install net-tools

--> Search in all man pages for some keywork or command
This tell you the command that have that word in the man page
$ man -k ifconfig
$ man -k uname
$ man -k "copy files"

Doing the same as above with another command
$ apropos ifconfig

