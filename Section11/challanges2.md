# Secction 21: Challenges - Bash Scripting

## Challenges - Flow Control (if...elif...else) and Command Substitution

#### Challenge #1

1. Create a script that takes an argument and tests if it's a file or not.

- $ vim script_chanllange6.sh
- code: /scripts_playground/script_chanllange6.sh
- $ chmod +x script_chanllange6.sh
- $ ./script_chanllange6.sh

#### Challenge #2

1. Consider the solution from the previous challenge. Change it so that it tests if the script is run with exactly one argument.

- $ vim script_chanllange7.sh
- code: /scripts_playground/script_chanllange7.sh
- $ chmod +x script_chanllange7.sh
- $ ./script_chanllange7.sh

#### Challenge #3

1. Create a script that clears the contents of a text file which is the script’s argument.
2. Test that the argument is a file.

- $ vim script_chanllange8.sh
- code: /scripts_playground/script_chanllange8.sh
- $ chmod +x script_chanllange8.sh
- $ ./script_chanllange8.sh

#### Challenge #4

1. Create a script that drops the packets from an IP address given by the user.
2. Example: The command to drop the packets from 100.0.0.1 is: iptables -I INPUT -s 100.0.0.1 -j DROP
3. Run the script as root and test the connection to different IP addresses.

- $ vim script_chanllange9.sh
- code: /scripts_playground/script_chanllange9.sh
- $ chmod +x script_chanllange9.sh
- $ ./script_chanllange9.sh

#### Challenge #5

1. Change the solution from the previous challenge so that the IP address is given as the first argument of the script.
2. Test that the script is run with exactly one argument.

- $ vim script_chanllange10.sh
- code: /scripts_playground/script_chanllange10.sh
- $ chmod +x script_chanllange10.sh
- $ ./script_chanllange10.sh

#### Challenge #6

1. Develop a script that appends to a file the currently logged in users and the current date and time.

- $ vim script_chanllange11.sh
- code: /scripts_playground/script_chanllange11.sh
- $ chmod +x script_chanllange11.sh
- $ ./script_chanllange11.sh

#### Challenge #7

1. Create a script that prompts the user for a character.
2. If the character is Y, display "YES". If the character is N, display "NO". Use double quotes when displaying YES and NO. If the user enters any other character exit the script.

- $ vim script_chanllange12.sh
- code: /scripts_playground/script_chanllange12.sh
- $ chmod +x script_chanllange12.sh
- $ ./script_chanllange12.sh

#### Challenge #8

1. Change the previous script this way: If the character is Y or y display "YES". If the character is N or n display "NO". If the user enters any other character exit the script. Use the OR operator (||) for testing the lowercase y and n.

- $ vim script_chanllange13.sh
- code: /scripts_playground/script_chanllange13.sh
- $ chmod +x script_chanllange13.sh
- $ ./script_chanllange13.sh

#### Challenge #9

1. Create a script that takes exactly two arguments. The first argument is a shell command and the second argument is a string. The script will check if the string belongs to the output of the command.

Example: ./search_in_output.sh "ifconfig -a" "flags" will say if the string flags belongs to the output of ifconfig -a

- $ vim script_chanllange14.sh
- code: /scripts_playground/script_chanllange14.sh
- $ chmod +x script_chanllange14.sh
- $ ./script_chanllange14.sh