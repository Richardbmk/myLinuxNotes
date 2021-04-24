# Section 11: Linux Process Management

## 87. Processes and The Linux Security Model

- $ type ls ==> To check if a command is an executable command
- $ type cp
- $ type cd
- $ type umask

- $ ps -ef | less
- $ top

## 88. Listing Processes (ps, pstree)

- commands to find info about the running processes:
- $ ps
- $ pgrep
- $ pstree
- $ top
- $ id

- $ ps -e ==> Display all process that are running
- $ ps -f ==> Display full status information
- $ ps -ef ==> Display all process with detailled information
- $ ps -ef | wc -l ==> gives the number of all process

- $ ps -ef | less
- $ man sshd

- $ ps -aux
- $ ps aux
- $ ps -aux | less
- $ ps aux --sort=%mem | less ==> sort by memory ascending oreder
- $ ps aux --sort=-%mem | less ==> descending order

- $ ps -f -u student ==> To see all the user student process
- $ ps -f -u root ==> To see all the user root process

- $ ps -ef | grep sshd ==> To se if a determinat process is currently running
- $ ps -ef | grep xyz123 ==> You will have an output

- $ pgrep sshd ==> to see if a process is running
- $ pgrep init
- $ pgrep python3
- $ pgrep systemd

- $ pgrep -l sshd
- $ pgrep -l cups
- $ pgrep -u root sshd

- $ pstree | less
- $ pstree -c | less

## 90. Getting a Dynamic Real-Time View of the Running System (top, htop)

- $ top
- $ man top

**INSIDE THE TOP COMMAND:**

- PRESS Arrow Up ==> move up
- PRESS Arrow Down ==> mode down
- PRESS "h" ==> to see a help summary
- PRESS 1 ==> cpus or numa node views
- PRESS 't' ===> task/cpu stats
- PRESS 'm' ===> memory info
- PRESS 'b' ===> bold/reverse (only if 'x' or 'y')

- $ top -d 1 -n 3 -b > top_processes.txt
  - "d" ==> means the delay (seconds)
  - "n" ==> means the iterations (nº of iterations)
  - "b" ==> start/stop in batch mode
- $ less top_processes.txt
- $ grep rsyslogd top_processes.txt

- $ sudo apt update && sudo apt install htop
- $ htop

## 92. Signals and Killing Processes (kill, pkill, killall, pidof)

- $ kill
- $ kill -l ==> to get a list of all available signal
- $ pgrep -l gedit ==> To find the process ID of gedit (the Text Editor)
- $ kill -2 14804

- $ pidof firefox
- $ kill -INT (copy and paste all the process ID)

- $ kill -SIGINT $(pidof firefox)

- $ sudo systemctl status ssh
- $ sudo systemctl start ssh
- $ sudo systemctl stop ssh

- $ tail -f /var/log/auth.log ==> ssh deamon in real time

- $ ls /var/run
- $ cat /var/run/sshd.pid
- $ pgrep -l sshd

- $ sudo kill -1 701
- $ sudo kill -1 $(cat /var/run/sshd.pid)

- $ sleep 123& ==> process or delay the execution for a given seconds
- $ sleep 321&

- $ killall ==> kills all processes

- $ pgrep -l sleep ==> you will see two sleep process running

- $ killall -15 sleep

- $ sleep 123&
- $ sleep 321&
- $ pgrep -l sleep

- $ killall slee ==> will not work with a partial name
- $ pkill slee ==> it will work with a partial name

## 93. Foreground and Background Processes

- $ sleep 15 ==> A **Foreground** process will start and you can not use the terminal until stops (15 seconds)

- $ sleep 15& ==> A **Background** process will start but you can still use the terminal

- $ ifconfig > output.txt 2> errors.txt &
- $ cat output.txt
- $ cat errors.txt

- $ ping -c 1 google.com &
- $ pint -c 1 google.com > /dev/null 2>&1 &
- $ pint -c 1 127.0.0.1 > /dev/null 2>&1 &

## 94. Job Control (jobs, fg, bg)

- $ sleep 25&
- $ sleep 35&

- $ jobs ==> displays the two sleep jobs

- $ jobs -l ==> display the process id also

- $ sleep 10 & ==> This run in the buckground
- $ josbs
- $ fg %1 ==> bring the 1 running job to the foreground

- $ sleep 10
- PRESS CRTL + C
- $ pgrep -l sleep ==> the process still in the process list
- $ jobs
- $ bg %1 ==> resume the process in the background

- $ sleep 432
- CTRL + C
- $ jobs
- $ fg %1 ==> Resume it in the Foreground

- $ nohup sleep 1234 & ==> it will run even if you close the terminal
- CLOSE THE TERMINAL AND OPEN AGAIN
- $ pgrep -l sleep ==> still there running

- $ nohup sleep 123 &
- $ nohup ifconfig &
- $ cat nohup.out
