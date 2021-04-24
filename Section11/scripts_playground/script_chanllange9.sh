#!/bin/bash
read -p "IP Address to drop: " ip
iptables -I INPUT -s $ip -j DROP
echo "All packets from $ip will be dropped."