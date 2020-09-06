#!/bin/bash
# This little script will shutdown the PC ( ubuntu in my case ) if i fall asleep while watching a movie after 2 hours 
#
#
idletime=$((1000*60*60*2)) # 2 hours in milliseconds

while true; do
    idle=`xprintidle`
    echo $((idle / 1000)) 
    if (( $idle > $idletime )); then
        sudo shutdown -P now  # assuming that the user isn't prompted for password at sudo see below 
    fi
    sleep 1
done

############################ Avoid being asked for password with sudo 
# 1- PIPING ?
# echo 'password' | sudo -S command 
#
#  or 
# 2- Behold i'm a super sudo user for shutdown only :p
#
# user_name ALL=(ALL) NOPASSWD: /sbin/shutdown
#
#