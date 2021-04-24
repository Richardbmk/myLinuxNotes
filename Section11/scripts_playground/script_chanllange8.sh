#!/bin/bash
if [[ -f $1 ]]
then
    echo "" > $1
    echo "$1 contents was cleared!"
else
    echo "The script's argument should be a file!"
fi