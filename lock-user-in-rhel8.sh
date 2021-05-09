#!/usr/bin/bash

ts=$(date +%F)

while :
do
        read -p "Enter Ur username to lock and backup: " user

        if [ -z $user ]

        then
                echo "username is not provided"
        else
                if id $user &> /dev/null
                then
                        passwd -l $user
                        homeDir=$(grep ^${user}:  /etc/passwd | cut -d ":" -f 6)
                        echo $homeDir
                        if [ -d $homeDir ]
                        then
                                echo "home dir exists..."
                                tar -cf ${user}-${ts}.tar $homeDir
                        fi
                        exit 0
                else
                        echo "provided user $user not exists..."
                fi
        fi
done

exit 1
