# Section 20: Bash Shell Scripting

## 150. Intro to Bash Shell Scripting

- $ echo $0 ==> to see what shell is started
- $ cat /etc/shells ==> to see all the default shell availables
- $ cat /etc/passwd ==> to see te default shell of an user

- What is shell scripting?
- Repetitive Task Automation?

- $ mkdir scripts
- $ cd scripts/
- $ ls

- $ vim first_script.sh ==> write what you need

- $ chmod u+x first_script.sh ==> make the file executable
- $ chmod 700 first_Script.sh ==> anothe way of making the file executable

- $ ./first_script.sh ==> the way you execute the file
- $ ~/first_script.sh

- $ echo $PATH ==> is where the shell looks for executable

## 151. The Bash Shebang and Comments

- What program will run the file?
- $ cat first_script.sh
- $ which bash
- $ which -a bash

- $ ls -li /bin/bash /usr/bin/bash ==> hardlinks (both path point to the same files)

- $ vim first_script.sh ==> adding sheebang to the first line
- #!/bin/bash

- $ vim myscript1 (python code inside)
- $ chmod 700 myscript1
- $ ./mycript1 ==> it will not work, becouse the code is python and the default interpreter is bash

- $ which python3
- $ vim myscript1 (adding the python path (shebang))

- $ vim ~/.vimrc ==> to make changes in VIM persistence
    - write: set nu `

## 152. Running Scripts

- $ ./myscript1
- $ bash first_script.sh
- $ python3 myscript1


- $ chmod -x first_script.sh ==> taking out executable permision
- $ bash first_script.sh ==> the script will run fine even without executable permisions
- ./first_script.sh ==> it will not work

- $ chmod +x first_script.sh
- $ ./first_script.sh ==> this run in a new shell
- $ source first_script.sh <= OR => . first_script.sh ==> this run in the current shell
























