# Section 9: Linux File Permissions

## 80. Understanding SUID (Set User ID)

Special permision:
- SUID: Set User ID
- SGID: Set Goup ID
- Sticky Bit

- $ which cat
- $ ls -l /usr/bin/cat

- $ cat /etc/shadow

- $ ls -l /etc/shadow

- $ id

- $ stat /usr/bin/cat
- 0755 ==> "0" means no special permition

- $ sudo chmod 4665 /ust/bin/cat
- ls -l /usr/bin/cat

- $ sudo chmod u-x /usr/bin/cat ==> removing execution permision for the owner
- $ ls -l /usr/bin/cat

- $ sudo chmod u+x /usr/bin/cat ==> putting bag the execution permision for the owner
- $ ls -l /usr/bin/cat
- $ stat /usr/bin/cat


- $ sudo chmod u+s /usr/bin/cat ==> add SUID permision. These means it will have the permision of his owner, no mater who execute the file

- $ cat /etc/shadow

- $ sudo chmod u-s /usr/bin/cat
- $ ls -l /usr/bin/cat
- $ stat /usr/bin/cat

- $ find /usr/bin/ -perm -4000 ==> find files with at least 4000 permision
- $ find /usr/bin/ -perm -4000 -ls

## 81. Understanding SGID (Set Group ID)

- $ sudo su
- $ groupadd programmers
- $ useradd -s /bin/bash pr1
- $ useradd -s /bin/bash pr2

- $ usermod -aG programmers pr1
- $ usermod -aG programmers pr2
- $ groups pr1

- $ mkdir /programming

- $ chown pr1:programmers /programming
- $ ls -ld /programming/
- $ chmod 770 /programing/

- $ su pr1
- $ id

- $ cd /programming/
- $ touch source1.cpp
- $ ls 
- $ exit

- $ chmod 2770 /programming/ <=THE SAME=> $ chmod g+s /programming/
- $ stat /programming/
- $ ls -ld /programming/

- $ su pr2
- $ cd /programming/
- $ touch source2.cpp
- $ mkdir golang python
- $ ls -l

## 82. Understanding the Sticky Bit

- $ sudo su
- $ mkdir /temp
- $ chmod 777 /temp/

- $ ls -ld /temp/

Another user (not root):
- $ id
- $ cd /temp/
- $ touch file1.txt file2.txt
- $ chmod 600 file1.txt file2.txt <== SAME ==> $ chmod 600 file*

- ls -d . (we are in temp/)

Another user (not root, not the last one):
- $ su pr1
- $ id
- $ cd /temp/
- $ ls -l
- $ rm -rf file1.txt ==> the file was removed, an that is not supossed to happen
- $ exit

- $ sudo su
- $ chmod 1777 /temp/ ==> setting the sticky permision
- $ chmod o+t /temp/
- $ ls -ld /temp/

- $ su toor
- $ ls -l
- $ cd /temp/
- $ id
- $ rm -fr file2.txt ==> the benefit of sticky bit is that user can delete this file anymore.

- $ ls -ld /var/tmp/
- $ ls -ld  /temp/

## 83. Umask

- $ mkdir mydir
- $ touch myfile
- $ ls -l

- $ unmask ==> gives 002 as a value

DEFAULT PERMISIONS:
- 0666 default values for files
- 0777 default vaules for directories
- 0777 - 0002 = 0775 ==> defualt permision for newly created derectories
- 0666 - 0002 = 0664  ==> default permision for newly created files

- 0666 - umask = 0644 ==> you will have to change the defualt value of unmask (0022)

CHANGIND UMASK
- $ umask 0022
- $ mkdir mydir1
- $ touch myfile1
- $ ls -l ==> default permision will be now 0664

Make it permanent for a specific user (This is not common to do):
- vim .bashc

- At the end of the file write:
- umask 0022

## 84. Understanding Files Attributes (lsattr, chattr)

- $ lsattr ==> to see files Attributes

EXAMPLE:
--------------e----- ./dir10
- "e" ==> means extents formatting the block in disk
- "-" ==> means no attribute

- $ man chattr ==> "chattr" means change attribute

he  letters  'aAcCdDeFijPsStTu'  select  the new attributes for the
       files: append only (a), no atime updates  (A),  compressed  (c),  no
       copy  on  write (C), no dump (d), synchronous directory updates (D),
       extent format (e), case-insensitive directory lookups (F), immutable
       (i),  data  journalling  (j), project hierarchy (P), secure deletion
       (s), synchronous updates (S), no tail-merging (t), top of  directory
       hierarchy (T), and undeletable (u).

EXAMPLES:

- $ ls
- $ sudo chattr +a user.txt
- $ lsattr user.txt

- $ ls > user.txt ==> It is not permited
- $ sudo ls > user.txt ==> not even root can do that

- $ ls >> user.txt ==> this is something the attribute "a" let you do

- $ stat user.txt
- $ chattr +A user.txt
- $ lsattr user.txt

- $ cat user.txt ==> te access time will not be updated. This is something "A" attribute does.


- $ ls
- $ cat i.txt
- $ sudo chattr +i i.txt
- $ sudo rm -rf i.txt ==> Yo can do that. This is something "i" attribute does
- $ sudo ls > i.txt ==> Yo can do that. This is something "i" attribute does
- $ sudo ls >> i.txt ==> Yo can do that. This is something "i" attribute does
- $ sudo chmod 700 i.txt ==> Yo can do that. This is something "i" attribute does

CHANGE ATTRIBUTES RECURSIVELY:
- $ tree dir1/
- $ sudo chattr -R +i dir1/
- $ lsattr -R dir1/
- $ lsattr -R dir1/

- $ sudo chattr -R -i dir1/ ==> taking out the inmmutable attribute to be able to remove the file
- $ sudo chattr -R -i i.txt ==> taking out the inmmutable attribute to be able to remove the file
- $ sudo rm -rf i.txt
- $ sudo rm -rf dir1/

















