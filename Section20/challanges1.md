# Secction 21: Challenges - Bash Scripting

## Challenges - Bash Scripting Basics

#### Challenge #1

1. Suppose you connect frequently to a server located in a remote data center by running: ssh -l u123h -p 9956 191.169.0.1
2. Create an alias named main for the command and make it persistent after reboot.

- $ vim ~/.bashrc

- Append to the end:
"""
alias main="ssh -l u123h -p 9956 191.169.0.1"
"""


#### Challenge #2

1. Create a Bash script named script1.sh. Add the shebang.
2. Define a variable called country that holds the country you are living in.
3. Print the message: You live in YOUR_COUNTRY.
4. Run the script in different ways.

- $ vim script_chanllange2.sh
- code: /scripts_playground/script_chanllange2.sh
- $ chmod +x script_chanllange2.sh
- $ ./script_chanllange2.sh

#### Challenge #3

1. Create a script and define two string variables.
2. Add a commented line after the shebang and another inline comment.
3. Create a new variable by concatenating the two string variables.
4. Run the script.

- $ vim script_chanllange3.sh
- code: /scripts_playground/script_chanllange3.sh
- $ chmod +x script_chanllange3.sh
- $ ./script_chanllange3.sh

#### Challenge #4

1. Develop a Bash script that creates a new group and a new username. The group will be the user’s secondary group.
2. The username and the group will be given as input by the user that runs the script.
3. The script will also display the last 2 lines from the files where the users and the groups are saved in Linux.
4. Test the script by running it as root.

- $ vim script_chanllange4.sh
- code: /scripts_playground/script_chanllange4.sh
- $ chmod +x script_chanllange4.sh
- $ ./script_chanllange4.sh


#### Challenge #5

1. Create a script called fix_permissions.sh that prompts the user for a directory and changes the permissions of all subdirectories to 755 and to all files to 644 recursively.

- $ vim script_chanllange5.sh
- code: /scripts_playground/script_chanllange5.sh
- $ chmod +x script_chanllange5.sh
- $ ./script_chanllange5.sh