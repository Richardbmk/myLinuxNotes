#!/bin/bash
echo -n "Enter Y or N: "
read c
if [[ "$c" == "Y" ]] || [[ "$c" == "y"]]
then
    echo "\"YES\""
elif [[ "$c" == "N" ]] || [[ "$c" == "n" ]]
then
    echo "\"NO\""
else
    echo "Another character. Existing ..."
fi