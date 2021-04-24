#!/bin/bash
read -p "Enter directory: " dir
echo -n "Changind files persmissions to 644 recursively..." 
find $dir -type f -exec chmod 644 {} \;
echo "Done"

echo -n "Changing subdirectories permisions to 755 recursively..."
find $dir -type d -exec chmod 755 {} \;
echo "Done"