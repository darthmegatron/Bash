#!/bin/bash

##This script will scan the system for malware, and, if results are negative, proceed to make a system backup img.

echo #Spacing
echo "Updating Malware Definitions"
echo #Spacing

sudo freshclam > /dev/null #Update ClamAV malware definitions, do not print to stout.

malware_scan=$(clamscan -r -i / | grep -i infected)

if [ "$malware_scan" == "Infected files: 0" ]; then
        echo "No Infected Files Have Been Found, Starting System Backup."
        sudo mount -t cifs -o credentials=~/Desktop/cifs_creds.txt //192.168.0.164/Plex/Backups /mnt
        today=$(date +%m%d%YY)
        sudo dd if=/dev/nvme0n1p1 bs=2048 | gzip -c > /mnt/backup_$today.img.gz 
        echo #Spacing
        echo "System Backup Complete."
        sudo umount /mnt

else
        echo "Infected Files Have Been Found, Cancelling System Backup."

fi
