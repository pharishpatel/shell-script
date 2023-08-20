#!/bin/bash

# our programme goal is install mysql

DATE=(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

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

 USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: please run the script with root access"
   exit 1
# else 
#     echo "INFO:: you are not user"
fi

# it is our responsibility to check installation succes or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "installing mysql" 

yum install postfix -y &>>$LOGFILE

VALIDATE $? "installing postfix"