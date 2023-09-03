#!/bin/bash


DATE=(date +%F)
LOGSDIR=/tmp
SCRIPT_NAME=$@
LOGFILE=$LOGSDIR/$0-$DATE.log
 USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


if [ $USERID -ne 0 ]
then 
   echo "$R ERROR:: please run the script with root access $N"
   exit 1
# else 
#     echo "INFO:: you are not user"
fi

#this function should validate previious command and inform user success or failure

VALIDATE(){
  #$1 --> it will receive the argument
if [ $1 -ne 0 ]
then 
   echo -e "$2 ... $R FAILURE $N$"
   exit 1
else 
   echo -e "$2 ... $G SUCCESS $N"
fi
}

cp mogodb.repo /etc/yum.repos.d/mongo.repo &>> LOGFILE

VALIDATE $? "copied Mongodb repo into yum,repo"

yum install mongodb-org -y  &>> LOGFILE

VALIDATE $? "Installation Mongodb" 

systemctl enable mongod  &>> LOGFILE

VALIDATE $? "Enabling Mongodb"

systemctl start mongod  &>> LOGFILE

VALIDATE $? "Starting Mongodb" 

sed -i 's/127.0.0.0/0.0.0.0/' /etc/mongod.conf &>> LOGFILE

VALIDATE $? "Edited Mongodb conf" 

systemctl restart mongod  &>> LOGFILE

VALIDATE $? "Restarting Momgodb"
 