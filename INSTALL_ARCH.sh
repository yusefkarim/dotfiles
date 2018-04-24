#!/bin/bash
if [ $(id -u) -ne 0 ]; then
	echo "You need to run this as root, idiot."
	exit 1
fi

for i in `cat pkglist_arch.txt`
do
	echo ""
	echo -e  "######### Install $i? (y)es (n)o (q)uit: \c"
	read -n 1 answer
	echo ""
	if [ $answer == 'y' ]; then
	    pacman -Sy --noconfirm $i
	elif [ $answer == 'n' ]; then
	    continue
	else
	    exit 0
	fi
done	
