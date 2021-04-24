# Secction 21: Challenges - Bash Scripting

## Challenges - Loops in Bash: for, while

#### Challenge #1

1. Consider the following variable: friends="Anne John Jenna Arena Paul Dan"
2. Create a script that uses a simple for loop and says Hello to each friend in the list.

- $ vim script_chanllange15.sh
- code: /scripts_playground/script_chanllange15.sh
- $ chmod +x script_chanllange15.sh
- $ ./script_chanllange15.sh

#### Challenge #2

1. Create a script that prompts the user for a file. Test that it’s a file.
2. Prompt the user for 2 positive integers n and m.
3. Display the lines (from line number n to m, both inclusive) of the text file.

- $ vim script_chanllange16.sh
- code: /scripts_playground/script_chanllange16.sh
- $ chmod +x script_chanllange16.sh
- $ ./script_chanllange16.sh

#### Challenge #3

1. Create a script that displays odd numbers between 1 and 50.

- $ vim script_chanllange17.sh
- code: /scripts_playground/script_chanllange17.sh
- $ chmod +x script_chanllange17.sh
- $ ./script_chanllange17.sh

#### Challenge #4

1. Develop a script that will create 5 text files in the current directory.

- $ vim script_chanllange18.sh
- code: /scripts_playground/script_chanllange18.sh
- $ chmod +x script_chanllange18.sh
- $ ./script_chanllange18.sh

#### Challenge #5

1. Develop a script that prompts the user for a number n and then creates n text files in the current directory.

- $ vim script_chanllange19.sh
- code: /scripts_playground/script_chanllange19.sh
- $ chmod +x script_chanllange19.sh
- $ ./script_chanllange19.sh

#### Challenge #6

1. Consider the solution from the previous challenge. Add a testing condition so that the user enters a positive integer less than 100.

- $ vim script_chanllange20.sh
- code: /scripts_playground/script_chanllange20.sh
- $ chmod +x script_chanllange20.sh
- $ ./script_chanllange20.sh

#### Challenge #7

1. Consider the solution from the previous challenge.
2. Change the script so that it creates a file every 3 seconds and the name of each file will be current_minute_second

- $ vim script_chanllange21.sh
- code: /scripts_playground/script_chanllange21.sh
- $ chmod +x script_chanllange21.sh
- $ ./script_chanllange21.sh

#### Challenge #8

1. Create a script that takes some IP addresses as arguments and sends one ping packet to each ip address.

- $ vim script_chanllange22.sh
- code: /scripts_playground/script_chanllange22.sh
- $ chmod +x script_chanllange22.sh
- $ ./script_chanllange22.sh 8.8.8.8 1.1.1.1 23.23.23.100

#### Challenge #9

1. Change the solution from the previous challenge so that the script reads the IP addresses from a text file that is given by the user.

- $ vim script_chanllange23.sh
- code: /scripts_playground/script_chanllange23.sh
- $ chmod +x script_chanllange23.sh
- $ ./script_chanllange23.sh