#!/bin/bash
if [[ $# -ne 2 ]]
then
    echo "Run the script with exactly two arguments"
    exit
else
    output="`$1`"
    if [[ "$output" == *"$2"*]]
    then
        echo "$2 belongs to the output of $1"
    else
        echo "$2 DOES NOT belongs to the output of $1"
    fi
fi