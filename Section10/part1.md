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

- cat /tmp/date_and_time.txt

- $ contrab -r ==> To remove your crontab file (Don't do this!!)

- $ sudo su
- $ id
- $ crontab -e -u student ==> It will open the crontab of the user student
    -  * */5 * * * apt update

- $ crontab -r -u student ==> delete the crontab of user student
- $ exit

- $ crontab -l ==> To look for crontab

- $ man crontab

**System Cronjobs**

- $ ls /etc/cron.
- $ less /etc/crontab

## 126. Scheduling Tasks Using Anacron (anacron)

- $ man anacron
- $ cat etc/anacrontab
    - First column: run every x days
    - Second column: delay in seconds (it to run with delay)
    - Third column: job identifier. var/spool/anacron (contains the last time the job was executed)

- $ sudo vim /etc/anacrontab
    - 2     1       backup  date >> /tmp/anacron.txt

- $ anacron -T ==> To check for errors
- $ sudo anacron -d ==> TO test the anacron job

- $ sudo cat /var/spool/anacron/ ==> Looking fro anacron jobs
- $ sudo cat /var/spool/anacron/backup ==> Looking fro anacron jobs

## 127. Mounting and Unmounting File Systems (df, mount, umount, fdisk, gparted)

- $ ls /
- $ mount ==> Display currently attach file systems

- $ mount -l -t ext4 ==> diplay only partition for type ext4
- $ mount -l -t vfat ==> diplay only partition for type vfat

- $ ls -l /dev/sdb 
- $ sudo fdisk -l ==> To find the name of the device child
- $ dmesg ==> TO find the name of the device
- $ lsblk ==> To list all block devices

**MOUNT A DEVICE IN A DIRECTORY**
- $ mkdir ~/Desktop/usb
- $ sudo mount /dev/sdb ~/Desktop/usb ==> /dev/sdb (path and name of the device)
- $ ls ~/Desktop/usb
- $ mount -t vfat -l
- $ sudo mount -t vfat /dev/sdb /home/student/Desktop/usb/

- $ sudo umount /home/student/Desktop/usb
- $ sudo umount -l /home/student/Desktop/usb ==> "l" unmount it wiil do when it posible
- $ sudo mount -o ro /dev/sdb /home/student/Desktop/usb ==> ro = read onli
- $ mount -l -t vfat

- $ sudo mount -o rw,remount /dev/sdb /home/student/Desktop/usb
- $ mount -l -t vfat

**MOUNT AN ISO FILE**
- $ mkdir ~/iso
- $ sudo mount /path_to_iso_file ~/iso -o loop
- $ sudo fdisk

- $ sudo apt install gparted ==> App for mount an unmount 
- $ sudo gparted

## 128. Working With Device Files (dd)

- $ man dd
- $ df -h

- $ sudo su
- $ fdisk -l ==> list disk devices to find the name of the usb
- $ lsblk ==> List block devices

- $ dd if=/dev/sbd of=/home/student/backuo-usb.img status=progress

- $ ls -l /home/student/backup-usb.img

- $ dd if=/home/student/backuo-usb.img of=/dev/sbd status=progress

- $ dd if=/home/student/backuo-usb.img of=/dev/sbd status=progress conv=sync


