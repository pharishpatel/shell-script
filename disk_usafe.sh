#!/bin/bash

#colors
#validations
#log redirections

LOGFILE_DIRECTORY=/tmp
DATE=(date +%F:%H:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')

DISK_USAGE_THRESHOLD=1
message""

while IFS= read line
do
    # this command will give you number formate fir comparison
   usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
   # this command will give you partition
   partition=$(echo $line | awk '{print $1}')
   # now you need to check it is more than threshold or not
   if [ $usage -gt $DISK_USAGE_THRESHOLD ];
   then 
        message+='HIGH DISK USAGE on $partition: $usage \n'
   fi
   done <<< $DISK_USAGE
   
   echo -e "message: $message"
