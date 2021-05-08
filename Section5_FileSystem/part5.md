# Section 5: The Linux File System

## 58. Compressing and Archiving Files and Directories (tar, gzip)

- $ man tar

archive and comprese are not the same!
archive ==> 10 files of 100 kilobytes = resulting file is 1000 kilobytes
compress ==> 10 files of 100 kilobytes = resulting file is few kilobytes depending on the file type.

- $ sudo tar -czvf etc.tar.gz /etc/ ==> compressing the directory /etc/ (display somthing in the screen because of "v")
- $ sudo tar -czf etc.tar.gz /etc/ ==> compressing the directory /etc/ (does not display anything in the screen)

- $ sudo tar -czvf /tmp/etc.tar.gz /etc/ ==> compressing the directory /etc/ (in another path)

- $ sudo tar -cjvf etc.tar.bz2 /etc/ ==> it is just another way of compressing file (bz2 is a compression algorithim)

- $ tar -czvf archive.tar.gz /etc/passwd /etc/group /var/log/dmesg ==> compress multiple files

- $ sudo tar -czvf archive.tar.gz /etc/passwd /etc/group /var/log/dmesg /etc/ssh/ ==> compress multiple files and directories

**EXCLUDE SOME FILES WHILE COMPRESING**
- $ tar --exclude='*.mkv' --exclude='.config' --exclude='.cache' -czvf myhome.tar.gz ~

**EXTRACTING ARCHIVE**
- $ tar -xzvf etc.tar.gz

- $ mkdir my_backup
- $ tar -xjvf etc.tar.bz2 -C my_backup/

- $ ls -lh
- $ sudo du -sh /etc/ ==> give the file size

- $ tar -tf etc.tar.bz2 | grep sshd_config ==> to check if a file is inside the archive
- $ tar -tf etc.tar.bz2 | grep apache2 ==> to check if a file is inside the archive

- $ sudo tar -cjvf etc-$(date +%F).tar.bz2 /etc/ ==> creation of an archive with the current date

- $ date +%F

- $ tar -xvf coreutils-8.32.tar.xz

- $ gzip --help ==> "gzip" is for compressing files or directories
- $ gunzip --help ==> "gunzip" is for extract a gzip archive
- $ bzip2 --help
- $ bunzip2 --help

## 59. Hard Links and the Inode Structure

- $ ls -l
- $ ls -i 
- $ ls -li

- $ touch a.txt
- $ ls -li a.txt

- $ cat a.txt
- $ ls -li a.txt

simple interpretation:
669657 drwxr-xr-x 2 rickdevops rickdevops 4096 feb  4 17:23 Music
- 669657 ==> this is the Inode Structure o inode
- 2 ==> is the hard link, it means to hard links

- $ stat a.txt

- $ ln a.txt b.txt ==> this create a hard link
- $ ls -li

- $ ifconfig > a.txt
becouse of the hard link you will see the same in both files:
- $ cat a.txt
- $ cat b.txt

- $ ln b.txt my_buckup/c.txt ==> hard link in another path
- $ ls -li
- $ ls -li mu_backup/ ==> you will see 3 hard links with the same inode

- $ rm a.txt
- $ ls -li ==> 2 hard links

- $ find . -inum 276654 ==> find directories or files with that hard link

- $ ls -ld /etc/

- $ find /usr/ -type f -links +1 ==> finde files with more than 1 link
- $ find /usr/ -type f -links +1 -ls

## 60. Working With Symlinks. Symlinks vs. Hard Links

- $ ln -s /etc/passwd ./pswd ==> symlink creation
- $ ls -l pswd

- $ ps aux > processes.txt ==> save all runing process in that file
- $ cat processes.txt
- $ ln processes.txt p.txt ==> hardlink creation
- $ ln -s processes.txt symlink_p.txt ==> symlink creation
- $ ls -li

- $ cat symlink_p.txt

- $ mv processes.txt Desktop/
- $ cat processes.txt

- $ ls -l
- $ cat symlink_p.txt










