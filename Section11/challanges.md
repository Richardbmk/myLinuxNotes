# Secction 12: Challenges - Process Management

## Challenges - Processes

#### Challenge #1

1. List all running processes.

- $ ps -ef
- $ ps aux
- $ ps aux | less

2. Check if a process named bash is running (use both ps and pgrep).

- $ ps -ef | grep bash
- $ pgrep -l bash

#### Challenge #2

1. Using the ps command list all processes sorted by memory in reverse order.

- $ ps -ef --sort=-%mem
- $ ps aux --sort=-%mem
- $ ps aux --sort=-%mem | less

2. Redirect the output to a file called processes.txt

- $ ps -ef --sort=%mem > processes.txt
- $ less processes.txt

#### Challenge #3

1. Start top, sort processes by CPU and highlight the running processes and the sorting column.

- $ top
- SHIFT + p ==> sort process by cpu
- PRESS "x" ==> TO higlight the sorted culumn and the running processes
- PRESS "y" ==> TO higlight the running processes

#### Challenge #4

1. Generate a text file that contains 3 runs (refreshes) of top with a delay of 1second.

- $ top -d 1 -n 3 -b > file.txt
- $ less file.txt

#### Challenge #5

1. Install htop and start it.

- $ sudo apt update && sudo apt install htop
- $ htop

#### Challenge #6

1. Using the kill command send the default signal (SIGTERM - 15) to the current terminal.

- $ ps -ef | grep term
- $ kill terminal_process_ID (SECOND COLUMN OF THE ps output)

#### Challenge #7

1. Start a graphical application like gedit or firefox.

- use the user UI to open the apps

2. Find its PID and send the SIGINT (2) signal to the application.

- $ pgrep -l edit
- $ kill -2 PID_NUMBER

- $ kill -l
- $ kill -SIGINT $(pidof gedit)

#### Challenge #8

1. Start a graphical application like gedit from a terminal in the background.

- gedit &

2. Kill the application using pkill.

- pkill gdit

#### Challenge #9

1. Run a command that takes some time to complete like ls -lR / in the foreground. After a few seconds stop (pause) the command by pressing Ctrl + Z.

- ls lR /
- CTRL + Z

2. Print its JOBID and PID and resume the command in the foreground.

- jobs
- jobs -l
- fg %1

#### Challenge #10

1. Run sleep 100 in the background.

- $ sleep 100 &

2. Close the terminal, open it again and check if the process is still running.

- $ pgrep -l sleep

3. If it’s not running, run sleep 100 again making it immune to the closing terminal.

- $ nohub sleep 100 &
- $ pgrep -l sleep
- $ ps -ef | grep sleep
