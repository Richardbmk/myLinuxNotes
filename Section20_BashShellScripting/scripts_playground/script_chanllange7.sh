#!/bin/bash
if [[ $# -eq 1 ]]
then
    if [[ -f "$1" ]]
    then
        echo "The argument is a regular file."
    else
        echo "The argument is not a regular file."
    fi
else
    echo "The script was run with $# arguments. You should run it with exactly one argument."
fi