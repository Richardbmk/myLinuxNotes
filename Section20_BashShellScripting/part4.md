# Section 20: Bash Shell Scripting

## 158. If, Elif and Else Statements

**JUST PLAY AROUND WITH THE SCRIPTS**

- ./scripts/

- $ vim display.sh
  - code: ./scripts/bash_if_display_file_or_dir.sh
- $ chmod 700 display.sh
- $ ./display drop_ip.sh

- $ man test ==> to checkout all IF testing conditions available

- $ ./display.sh /etc/passwd
- $ ./display.sh /etc
- $ ./display.sh sdlkdf

- double square brakets it is just a good practice.

## 161. Command Substitution

- $ date
- $ now="`date`"
- $ echo $now

- $ users="$(who)" ==> the same result as before
- $ echo $users

- $ ps -ef | grep bash
- $ output="$(ps -ef | grep bash)"
- $ echo "$(output)"

- $ man date ==> search of how to display the date
- $ date +%F
- $ date +%F%H%M

- $ sudo tar -czvf etc.tar.gz /etc/
- $ ls
- $ sudo tar -czvf etc.tar.gz /etc/ ==> You will overwrite the archive

- $ sudo tar -czvf etc-$(date +%F%H%M).tar.gz /etc/ ==> is better to use this aproach

## 162. Comparing Strings in If Statements

- $ vim compare_string.sh

  - go to scripts

- -n ==> returns True is the return string is non zero
- -z ==> returns True is the return string is zero

## 163. Lab: Testing Network Connections

## 173. Running a DoS Attack Without root Access (ulimit)

DO NOT RUN THIS!! is for **crashing the system!!**

- $ id
- $ vim bomb

"""

$0 && $0 &

"""

- $ chmod +x bomb
- $ ./bomb
- $ ls

- To fix this Attack, yo need to power off the virtual machine ans startin again

**HOW TO PREVENT**

- $ ulimit -u ==> number of available processes for the current user
- $ ulimit -a ==> to see limits avaible in the shell
- $ sudo vim /etc/security/limits.conf

  - Add at the end for user:

  * student hard nproc 2000

  - Add at the end for group:

  * @admins hard nproc 4000

- logout and login again

- $ cat bomb
- $ ./bomb ==> it will not work now!!!
