#!/bin/bash

echo #Spacing

echo WARNING! Use of this script will remove ALL traces of the target you enter from this system.

echo #Spacing
echo "Type a target for removal:"
read target
echo #Spacing
unwanted=$(find / -name "$target")
echo #Spacing

if [ "$unwanted" ==  "" ];then
	echo No matches were found.

else
	echo The following files will be deleted:
	echo $unwanted

	echo #Spacing
	echo Do you wish to proceed?[y/n]:
	read response
	echo #Spacing

	case $response in
		[yY]) for item in $unwanted;do
			rm -rf $item
			echo "$item" -  removed.
		done;;

		[nN]) echo No changes have been made.
			exit;;
	esac
fi
