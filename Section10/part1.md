# Section 17: System Administration

## 124. Task Automation and Scheduling Using Cron (crontab)

- $ pgrep -l cron
- $ sudo /var/spool/crontabs/

- $ which crontab

- $ ls -l /etc/crontab

- $ ls /var/spool/cron/
- $  crontab -l ==> Display the content of the crontab file of the current user

- $ crontab -e ==> To edit the current user crontab
- m(minutus) h(hours) dom(day of month) mon(month) dow(day of week)
- h ==> 0h - 23h
- dow ==> 0 - 7 | 7 = 0 ==> Sundays

- CRON JOB EXEMPLES:
    - 0 6 * * 0 /root/backup.sh ==> This run every sunday at 6:00
    - 0 6 * * * /root/backup.sh ==> This run every day at 6:00
    - * * * * * /root/check_space.sh ==> Run every minut
    - 0 4,6,10 * * * /root/check_space.sh ==> Run the task at 4 AM, 6 AM and 10 AM
    - 0 9-17 * * 1-5 /root/check_space.sh ==> Run the task 9h to 17h, Monday to Friday (run one per hour between the intervals)
    - 10 4,21 */3 ** ==> The task will run every 3 days at 4h at minut 10 and 21h minut 10 (*/3 ==> every tree days)

    - @yearly /root/happy_new_year ==> Run the task every 1st of Genuary at midnight
    - @monthly /root/task.sh  ==> 1st of the month at midnight
    - @weekly /root/task.sh ==> One a week on Sunday
    - @daily /root/task.sh 
    - @hourly /root/task.sh 
    - @reboot /root/task.sh ==> run at boot time
- */2 * * * * date >> /tmp/date_and_time.txt

- $ tail -f /var/log/syslog ==> TO see how cron runs the command
