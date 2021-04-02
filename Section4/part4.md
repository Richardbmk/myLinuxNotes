# Section 5: The Linux File System

## 54. Comparing Files (cmp, diff, sha256)

- $ ifconfig > a
- $ ping 8.8.8.8
- $ ifconfig > b

- $ ls 

- $ cmp a b ==> cmp compare to files byte by byte
- $ cmp a a ==> doen't say anything if the files doesn't match

- $ which ls
- $ cp /usr/bin/ls .
- $ cmp /usr/bin/ls ./ls ==> compare the two ls

another way to identify if to files are identical:
comparing the hash
- $ sha256sum /usr/bin/ls ./ls ==> you should see the hash of each file

- $ echo "a" > ls 
- $ cmp /usr/bin/ls ./ls
- $ sha256sum /usr/bin/ls ./ls

- $ diff a b ==> line by line you see the differences between files
- $ cat a
- $ cat b

- $ sudo apt install ssh

- $ cp /etc/ssh/sshd_config .
- $ vi sshd_config (change something anything)
- $ diff /etc/ssh/sshdconfig ./sshd_config ==> 
EXAMPLE OF POSIBLE OUTPUT:
15c15
'<' #Port 22
--
'>' Port 29

INTERPRETATION:
15c15 ==> mean change line 15 in the first file by line 15 in the second file. The 'c' character could be also 'a' to append or 'd' to delete

'<' ==> mean line from the first file
'>' ==> mean line from the second file

- $ man patch ==> execute to understand what this comman is doing
- $ diff -B a b ==> "B" ignore blank lines
- $ diff -w a b ==> "B" ignore white spaces
- $ diff -w /etc/ssh/sshd_config sshd_config ==> "w" ignore white spaces
- $ diff -i /etc/ssh/sshd_config sshd_config ==> "i" ignore case differences
- $ diff -c /etc/ssh/sshd_config sshd_config ==> "c" for detailed comparison
- $ diff -y /etc/ssh/sshd_config sshd_config ==> "y" two columns showing the differences
- $ diff -y /etc/ssh/sshd_config sshd_config | less ==> "y" two columns showing the differences
 
## 55. The Basics of VIM Text Editor

- $ sudo apt install vim
- $ which vi 

- $ vi a.txt

- $ cp /etc/ssh/sshd_config .
- $ vim sshd_config

VIM COMMANDS:
- x ==> is like Supr in the keyboard
- r + replacement_character ==> "r" is for replace
- Esc ==> To be in the command mode
- i ==> insert mode
- Shift + i ==> start inserting at the begining of the line
- a ==> append the text
- Shift + a ==> append text to the end of the line

- ":" ==> last line mode
- ":q!" ==> quit the file without saving
- ":w!" ==> save the file without closing
- ":wq!" ==> save the file and quit
- Shift + zz ==> to save the file and close quickly

- vimtutor ==> to play around and learn!

## 56. The VIM Editor In Depth - Part 1

- $ vi sshd_config

RUNNING SHELL COMMAND IN THE VIM EDITOR
- ":!ls"
- ":!ifconfig"

SEARCHING FOR PATTERNS IN THE VIM EDITOR
- /ssh + ENTER
- n ==> navegate between matches
- Shift + n ==> go to the first match
- Shift + g ==> go to the end of the file
- ?Port + ENTER
- "*" ==> quick way to find the word under the cursor
- "#" - Alt Gr + 3 ==> quick way to find the word under the cursor (the previous one)

REPLACE WORDS
- ":%s/no/XXX/g" ==> replace the word "no" with XX
- ":e!" ==> undo the last changes (until the last save state)
- "u" ==> to undo the last operation only. (You have to be in command line mode)
- "SHIFT + u" ==> to REundo the last operation only. (You have to be in command line mode)
- "dd" ==> to cut a line
- "p" ==> to paster the cutted ("dd") line

- "7dd" ==> this cut 7 lines

- SHIFT + v ==> select a line (use the arrows to select more lines)
- "y" ==> to copy the selected lines
- "SHIFT + p" ==> to paste before the cursor
- "p" ==> to paste after the cursor

- ":set nu" ==> to display the line numbers
- ":set nonu" ==> not display the line numbers

SINTAX HIGHLIGHTING
- ":syntax off"
- ":syntax on"

MAKE SOME CHANGE PERMANENT:
- $ vim ~/.vimrc ==> 

write the vim commands you need to be permanent:
set nu
syntax on

- ":wq!" or SHIFT + zz

Now every time you open a file with vim, vim will run it with all the commands in that hidden file.

## 57. The VIM Editor In Depth - Part 2

- ":10" ==> this move to line 10
- SHIFT + g ==> move to last line of the file
- gg ==> move to the begining

WORKING WITH MULTIPLE FILES AT ONCE

- $ ifconfig > a
- $ who -a > b
- $ cat a
- $ cat b

- $ vim a b ==> display the the first file but..
- ":n" or ":next"  ==> to move to the second file
- ":prev"  ==> to move to the second file

- vim -o a b ==> stack window or see two windows at the same time
- Ctrl + w ==> moving between windows

COPY AND PASTE BETWEEN THE TWO WINDOWS (TWO FILES)
- SHIFT + v
- y
- Ctrl + w
- p

SEE FILES SIDE BY SIDE
- $ cp /etc/ssh/sshd_config .
- $ vim ssh_config (make some change any change)

- $ vim -d /etc/ssh/sshd_config sshd_config
- $ vimdiff /etc/ssh/sshd_config sshd_config ==> the smae as the line above










