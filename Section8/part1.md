# Section 13: Networking on Linux

## 97. Getting Information about the Network Interfaces (ip, ifconfig)

- $ ip
- $ ifconfig
- $ sudo apt install net-tools

- $ ifconfig -a ==> Display a list of all networking interfaces and the associated ip addresses

- $ ip address show ==> Display a list of all networking interfaces
- $ ip addr show
- $ ip a show

- $ ip a

- $ ip -4 address ==> Display only IPv4 address
- $ ip -6 address ==> Display only IPv6 address

- $ ifconfig enp0s3
- $ ip addr show dev enp0s3 <= OR => $ ip a s dev enp0s3

- $ route ==> Display the Kernel IP routing table
- $ route -n

- $ ip route show

- $ systemd -resolve --status ==> To see the DNS service run by the sytem

## 98. Configuring the Network On The Fly (ifconfig, ip, route)

- $ sudo su
- $ ifconfig

- $ ifconfig enp0s3 down ==> Get down the interface enp0s3
- $ ifconfig

- $ ifconfig enp0s3 up ==> Get up the interfaces enp0s3
- $ ifconfig

- $ ip link set enp0s3 down
- $ ip link show dev enp0s3

- $ ip link set enp0s3 up
- $ ip link show dev enp0s3

- $ ifconfig enp0s3 192.108.0.111/24 up
- $ ifconfig

- $ ip address del 192.168.0.111/24 dev enp0s3 ==> remove existing ip address
- $ ip address add 192.168.0.222/24 dev enp0s3 ==> add new ip address

- $ route -n ==> See the routing tables
- $ ip route show ==> TO see the defaul gateway

- $ route del default gw 192.168.0.1 ==> Removing default gateway configuration
- $ route add default gw 192.168.0.2 ==> Adding default gateway configuration

- $ route -n

- $ ip route del default
- $ ip route add default via 192.168.0.1
- $ ip route show

- **Change the mac address of an interface:**
- $ ifconfig enp0s3 down ==> Disable the interface
- $ ifconfig enp0s3 hw ether 08:00:27:51:05:09
- $ ifconfig enp0s3 up
- $ ifconfig

- $ ip link set dev enp0s3 address 08:00:27:51:05:01
- $ ip link show dev enp0s3

## 100. Setting Up Static IP on Ubuntu (netplan)

- You can do this with the GUI, these commands are for do it manualy!

- $ ls /etc/netplan
- $ sudo su

- $ systemctl stop NetworkManager
- $ systemctl disable NetworkManager
- $ systemctl status NetworkManager

- $ systemctl is-enabled NetworkManager ==> To check if NetworkManager will start at boot time

- **Yaml file creation:**

- $ vim /etc/netplan/01-netconfig.yaml

"""
version: 2
renderer: networkd
ethernets:
  enp0s3:
    dhcp4: false
    addresses:
      - 192.168.0.20/24
    gateway4: "192.168.0.1"
    nameservers:
      addresses:
        - "8.8.8.8"
        - "8.8.4.4"
"""

- $ netplan apply
- $ ifconfig
- $ route -n

- $ vim /etc/netplan/01-netconfig.yaml

## 102. Testing and Troubleshooting Network Connectivity

- $ ping ubuntu.com ==> send echo request packages continously
- $ ping ubuntu.com -n ==> "n" prevents reverse dns lookups
- $ ping -c 4 ubuntu.com ==> -c to send a number of packages

- $ ping -i 0.4 -c 5 google.com ==> any user can do this
- $ sudo ping -i 0.1 -c 5 google.com ==> You need to be root to send messages so fast

- $ ping -q -c 5 google.com ==> only display a summary

- $ ping -t 1 -c 3 -n ubuntu.com ==> to find out the first router ("t")
- $ ping -t 2 -c 3 -n ubuntu.com ==> to find out the first router ("t")

- $ man ping

- $ route -n 
- $ ping 192.168.0.1(your defualt Gateway)

- $ ping 1.1.1.1
- $ ping 8.8.8.8

## 103. Using SSH (in Centos the command are different)

- $ sudo apt update && sudo apt install openssh-server openssh-client
- $ systemctl status ssh

- $ ps -ef | grep sshd

- $ systemctl is-enabled ssh ==> Start ssh at boot time

- $ ifconfig ==> To serch the ip address

- $ ssh rickdevops@192.168.1.108 ==> Acces to the machine
- $ exit ==> Get out of the machine
- $ ssh -l rickdevops 192.168.1.108 ==> another way to access the machine

- $ ssh -p 22 -l rickdevops 192.168.1.108

- $ cat /etc/ssh/ssh_config

- **Now do it with Putty**


## 104. Troubleshooting SSH

- $ systemctl status ssh
- $ system ctl restart ssh
- $ system ctl stop ssh
- $ system ctl start ssh

- $ cat .ssh/known_hosts

- $ sudo iptables -vnL ==> check firewall rules
- $ sudo ufw status verbose  ==> "ufw" stand for User Friendly Frontend
- $ sudo ufw enable
- $ sudo ufw disable

- $ sudo ufw appt list ==> list all application profiles
- $ sudo ufw allow ssh ==> to allow incoming ssh connection
