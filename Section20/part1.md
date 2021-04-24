# Section 20: Bash Shell Scripting

## 148. Bash Aliases

- $ alias ==> you will see some of the aliases
- $ ll ==> This is an alias
- $ ls ==> This is another alias

- $ \ls ==> this is the way of writing the original ls command

- $ \ls -l /etc/

**ALIAS CREATION**

- $ alias c="clear"

- ~/.bash_profile ===> path to make persistence the ALIAS creation
- ~/.bashrc ===> path to make persistence the ALIAS creation

- $ vim ~/.bashrc ==> write what you need the end
    - alias now="date +%F\ %T" ==> adding new aliad with VIM editor in bashrc
    - wq ==> quit and save

- $ now
- $ source .bashrc ==> the alias will be available after running this
- $ now

- $ unalias now ==> To remove an alias in the current sesion

- $ alias server1="ssh -p 2234 user1@79.1.3.5"
- $ server1

- $ alias ports="netstat -tupan"
- $ ports

- $ alias root="sudo su"
- $ root

- $ alias update="sudo apt update && sudo apt dist-upgrade -y && sudo apt clean"
- $ update

- $ alias lt="ls -hSF --size -1"
- $ lt 
- $ lt /etc/
- $ lt /var/log
















