#!/bin/bash
read -p "Enter a file: " file

if [[ -f $file ]]
then
		read -p "Enter a positive integer n: " n
		read -p "Enter a positive integer m: " m
		q=$((m-n+1)) # no. of lines to display

		tail -n "+$n" $file | head -n $q
else
	echo "$file is not a file."
fi