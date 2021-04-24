#!/bin/bash
echo -n "Enter Y or N: "
read c
if [[ "$c" == "Y" ]]
then
    echo "\"YES\""
elif [[ "$c" == "N" ]]
then
    echo "\"NO\""
else
    echo "Another character. Existing ..."
    exit
fi