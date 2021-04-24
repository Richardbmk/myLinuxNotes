#!/bin/bash
if [[ $# -eq 1 ]]
then
    iptables -I INPUT -s $1 -j DROP
    echo "All packets from $ip will be dropped."
else
    echo "$# was given. The script must run with only 1 urgument."
fi

