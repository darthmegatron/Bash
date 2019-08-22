#!/bin/bash

# This script will zip all files in the current directory as long as the last 20 line of the given file do not contain any errors.


files="$(ls --ignore=*tar.gz | sort -h | head -n 20)"
today="$(date +%Y%m%d)"

for item in $files; do
    tail -n 20 $item | grep -iq error
	if [ $(echo $?) == 0 ]
		then
		    echo '---------- Error found on' $item ' ----------'
		    echo #  Console spacing
		    grep -i error $item
		    echo #  Console spacing
		    echo '*** Attention: This file will not be zipped ***'
		    echo #  Console spacing
		    echo '-----------------------------------------------'

	else
	    tar -zvcf $item-$today.tar.gz $item && rm -f $item
	    echo $item 'has been successfully zipped.'
	    echo #  Console spacing

	fi

done
