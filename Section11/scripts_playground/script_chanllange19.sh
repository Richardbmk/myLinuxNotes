#!/bin/bash

read -p "Enter the number of files to create:" n

i=0
while [[ $i -lt $n ]]
do
	touch "$i.txt"
	((i++))
done
echo "$n files were created!"