#!/bin/bash
PS3="Choose:"
select MENUITEM in "Display Date and Time" "List users logged in" "Display disk usage" "Quit"
do
	case $REPLY in
		1)
			date
			;;
		2)
			who -aH
			;;
		3)
			df -h
			;;
		4)

			echo "Quitting ..."
			sleep 1
			exit
			;;
		*)
			echo "Unknown selection."
			;;
	esac
done