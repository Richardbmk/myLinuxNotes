#!/bin/bash
for i in {1..5}
do
	touch "$i.txt"
done
echo "5 files were created."