#!/bin/bash
if [[ -f "$s1" ]]
then
    echo "The argument is a regular file."
else
    echo "The argument is not a regular file."
fi