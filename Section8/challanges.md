# Secction 14: Challenges - Networking in Linux

## Challenges - Network Interfaces

#### Challenge #1

1. List the IP address, the Default Gateway, the Mac Address and the DNS Servers.

- $ ifconfig
- $ ip a
- $ route

2. Use both ifconfig and ip commands.

- $ ifconfig
- $ ip a
- $ ip a show
- $ route -n 
- $ ip route show
- $ systemd-resolve --status ==> To see the DNS Servers

#### Challenge #2

1. Using ifconfig, disable the Ethernet interface.

- $ ifconfig 
- $ sudo ifconfig  set enp0s3 down
- $ ifconfig 




2. Using ip, enable the Ethernet interface.

- $ sudo ip link set enp0s3 up


3. Check its status both with ifconfig and ip.

- $ ifconfig -a
- $ sudo ip link show dev enp0s3

#### Challenge #3

1. Set a new temporary IP address using both ip and ifconfig.

- $ sudo ip address del 192.168.0.222/24 dev enp0s3
- $ sudo ip addr add 192.168.0.11/24 dev enp0s3
- $ ip a


- $ sudo ifconfig enp0s3 192.168.0.250/24 up

#### Challenge #4

1. Using ifconfig, set a secondary IP address on the Ethernet interface.

- $ ifconfig
- $ sudo ifconfig enp0s3:10 10.0.0.10/24 up
- $ ifconfig


#### Challenge #5

1. Change the MAC address to a random one.

- $ ifconfig
- $ sudo ifconfig enp0s3 down
- $ sudo ifconfig enp0s3 hw ether 08:00:27:9a:08:90
- $ sudo ifconfig enp0s3 up
- $ ifconfig

## Challenges - SSH, scp, rsync

#### Challenge #1

1. Start 2 Linux VMs with the network in bridged mode and check that they are reachable using ping.

- $ ping 192.168.1.108

#### Challenge #2

1. Install OpenSSH on one Linux VM, check the service status and then connect to it using the ssh client from the other Linux VM.

- $ sudo apt update && sudo apt install openssh-client openssh-server
- $ systemctl status sshd

- $ ssh rickdevops@192.168.1.108
- $ ssh -p 22 -l 192.168.1.108

#### Challenge #3

1. Secure the SSH Daemon:
    change the listening Port to 2266
    allow only a single non privileged user to connect to the SSH server.
    Disable root login entirely.

- $ sudo vim /etc/ssh/ssh_config

"""
[...]
Port 2266
[...]
PermitRootLogin no

AllowUsers students
"""

- $ sudo systemctl restart ssh
- $ sudo systemctl status ssh

- $ ifconfig

#### Challenge #4

1. Create a directory and a file in the user’s home directory.

- $ mkdir dir1
- $ touch dir1/file.txt

2. Using scp, copy both the file and the directory to the remote Linux VM where the SSH daemon is running.

- $ scp -r -P 22 dir1/ rickdevops@192.168.1.108:~

#### Challenge #5

1. Using scp, copy a file from the remote VM where the SSH daemon is running to the local machine, in the current directory.

- $ scp -P 22 student@192.168.1.109:~/file.txt .


#### Challenge #6

1. Solve the last 2 challenges using rsync instead of scp.

- $ ifconfig
- $ systemctl status ssh
- $ ls

- $ sudo rsync -av -e 'ssh -p 2266' centos/ student@192.168.0.111:~/centos/

- $ sudo rsync -av -e 'ssh -p 2266' student@192.168.0.111:~/myfile123 .
