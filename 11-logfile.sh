#!/bin/bash

# our programme goal is install mysql

DATE=(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

#this function should validate previious command and inform user success or failure

VALIDATE(){
  #$1 --> it will receive the argument
if [ $1 -ne 0 ]
then 
   echo "$2 ... FAILURE"
   exit 1
else 
   echo "$2 ... SUCCESS"
fi
}

 USERID=$(id -u)

if[ $USERID -ne 0 ]
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