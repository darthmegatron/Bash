#!/bin/bash

# This script will zip all files in the current directory as long as it does not contain any errors.

files="$(ls --ignore=*tar.gz | sort -hr | head -n 20)"
today="$(date +%Y%m%d)"

for item in $files; do
	tail -n 20 $item | grep -iq error
	if [ $(echo $?) == 0 ]
		then echo '---------- Error found on' $item ' ----------'
	fi
done
