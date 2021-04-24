#!/bin/bash

rectangle_area () {
	area=$(($1*$2))
	echo "The area of a rectangle with a width of $1 and a height of $2 is $area."
}

rectangle_area 3 5
rectangle_area 10 6