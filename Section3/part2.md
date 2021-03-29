# Seccition 3: The Linux Terminal In Depth

## 15. Mastering the Terminal: The TAB Key

EXEMPLE

- [TAB] == Mean press TAB

- ifc [TAB] autocomplit
- if [TAB] [TAB] find posible matches

- $ cat /etc/p [TAB]

## 16. Mastering the Terminal: Keyboard Shortcuts

- Ctrl + L ==> clear the screen
- clear ==> clear the command line
- Ctrl + D ==> Close the bash Shell
- Ctrl + A ==> Move the cursor to the bigining of the line
- Ctrl + E ==> Move the cursor to the end of the line
- Ctrl + U ==> Deletes all caracters in the line
- Ctrl + C ==> Stop the running process in the bash shell

Exemple
- ping 8.8.8.8 ==> This print packages continuosly
- Ctrl + C ===> To interrupt the process
- Ctrl + Z ===> To stop the process (can be restarted)
- $ bg %1 ==> Restart the process

## 18. Mastering the Terminal: The Bash History

- $ cat .bash_history ==> To see all the command a user has used

--> HISTFILESIZE
- $ echo $HISTFILESIZE ==> number of lines that can be stored in the history file (IS 2000)

- $ history

--> HISTSIZE
- $ echo HISTSIZE ==> How many cammands will be store in the memory (1000) Maximum 1000 commands in the memory!

--> Run specific command from the history
- $ !17 ==> run the 17 command in my history
- $ !! ==> This run the last command you type
- $ !-3 ==> begining to the last run the third command
- $ !ping ==> to search and run a command in our history
- $ !ping:p ==> just print and not execute the last command with ping in my history

- $ press [UP ARROW] or press [Ctrl + P] ==> To move up through the history
- $ press [Ctrl + R] ==> To search command through the history press [ENTER] to run it, if you do want to run it press [Ctrl + G]

--> Remove lines in your history
- $ history -d 17 ==> removes line 17 in the history
- $ history -c  ==> remove everything in the history

## 19. Running Commands Without Leaving a Trace

--> download and save a file localy
- $ wget https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png  

- $ [white space] [the_command_you_want_to_RUN] ==> run without Trace
EXAMPLE:
- $ ls -al

--> HISTCONTROL
- Allows you to ignore command and not save them.
- Set it to ignore space

example:
- $ echo $HISTCONTROL
--> To change the default
- $ HISTCONTROL=ignorespace ==> does not leave trace but allow duplicates
- $ HISTCONTROL=ignoresdups ==> don't allow duplicates
- $ HISTCONTROL=ignoreboth ==> ignore duplicates and whitespace

And ignoreboth allow to write command without leaving a trace!

--> Exploce
- $ cat .bashrc

## 20. Recording the Date and Time for Each Line in History
--> HISTTIMEFORMAT
- $ HISTTIMEFORMAT="%d/%m/%y %T"

- To make this change consistent you need to save it in the .bashrc file

- $ echo "HISTTIMEFORMAT="%d/%m/%y %T"" >> .bashrc
- $ cat .bashrc ==> to see the changes

## 22. root vs. Non-privileged Users. Getting root Access (sudo, su, passwd)

- $ sudo su ==> getting temporarly become root in a terminal
- $ id ==> prints the log in user and the group that belongs
- $ exit <==> $ Ctrl + D
- $ sudo su - ==> print the root working environment (fresh shell sesion)

- $ groupadd myadmin ==> you need to have root privilages
- $ sudo groupadd myadmin ==> it will work if the user have root privileges
- $ sudo useradd john
- $ sudo -v ==> update the cached credential without running a command
- $ sudo -k ==> invalidate user credentials

--> Change password
- $ sudo passwd root

- $ ls /
- $ ls /root/
