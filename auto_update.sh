#!/bin/bash
##Add to root crontab

#Error List
errors=""

#Update and Upgrade
output=$(apt-get update -y 2> /dev/null 2> /dev/null | grep Err) &&
        if [ "$output" != "" ]; then
                errors=$errors"Error Updating Packages "
        fi

apt-get dist-upgrade -y &> /dev/null &&
        if [ $(echo $?) -ne 0 ]; then
                errors=$errors"Error Upgrading Packages"
        fi

#Cleanup old dependancies
apt-get autoremove -y &> /dev/null &&

#Notification
function notify {
        if [ "$errors" != "" ]; then
                printf "The Following Errors Occurred During System Update: \n""$(echo $errors)\n" | wall
        else
                printf "System Update Completed Without Error" | wall
        fi
}

notify
