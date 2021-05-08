#!/bin/bash

read -p "Enter the number of files to create:" n
if [[ $n -le 0 ]] || [[ $n -ge 100 ]] 	# || is the logical OR operator
then
	echo "You entered $n. Enter a positive integer less than 100."
	exit 
fi

i=0
while [[ $i -lt $n ]]
do
	minute_second="$(date +%M%S)"
	echo "Creating $minute_second"
	touch "$minute_second"
	((i++))
	sleep 3
done
echo "$n files were created!"