#!/bin/bash

folder="$(cd ../ && pwd)"
source $folder/config.ini

process_date=$(date -d '1 hour ago' +%Y"-"%m"-"%d)
process_hour=$(date -d '1 hour ago' +%Y"-"%m"-"%d" 00:00:00")
#interval=$(date -d '1 hour ago' +%Y"-"%m"-"%d" "%H)

## Get user data
if [ -z "$userStats" ]; then
        echo ""
        echo "Not generating daily user Stats"
else
	echo "Get controller log data"
	echo ""
	grep Creating $PATH_TO_PoraclJS/logs/controller-$process_date.log > $folder/tmp/controller1440.log
        echo "Inserting all users"
        echo ""
        mysql -u$SQL_user -p$SQL_password -h$DB_IP -P$DB_PORT $STATS_DB -N -e "insert ignore into users (Datetime,RPL,id,type) select '$process_hour', '1440', id, type from $PORACLE_DB.humans where admin_disable=0;"
        echo "Get user data"

        query(){
        mysql -u$SQL_user -p$SQL_password -h$DB_IP -P$DB_PORT $STATS_DB -NB -e "$1;"
        }
        while read -r id _ ;do
        msgSend=$(grep $id $PATH_TO_PoraclJS/logs/discord-$process_date.log | grep 'Sending discord message' | grep -v '(clean)' | wc -l)
	mon=$(grep $id $folder/tmp/controller1440.log | grep 'Creating monster alert' | wc -l)
	raid=$(grep $id $folder/tmp/controller1440.log | grep 'Creating raid alert' | wc -l)
	egg=$(grep $id $folder/tmp/controller1440.log | grep 'Creating egg alert' | wc -l)
	invasion=$(grep $id $folder/tmp/controller1440.log | grep 'Creating invasion alert' | wc -l)
	quest=$(grep $id $folder/tmp/controller1440.log | grep 'Creating quest alert' | wc -l)

        if [ "$msgSend" != '' ]; then
                mysql -u$SQL_user -p$SQL_password -h$DB_IP -P$DB_PORT $STATS_DB -N -e "UPDATE users set msgSend='$msgSend', mon='$mon', raid='$raid', egg='$egg', invasion='$invasion', quest='$quest' WHERE id = '$id' and Datetime = '$process_hour';"
        fi
        done < <(query "select id FROM users where datetime = '$process_hour';")
fi




## TO BE DONE, aggregate to daily data
