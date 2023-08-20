#!/bin/bash

# our programme goal is install mysql

USERID=$(id -u)
#this function should validate previious command and inform user success or not
VALIDATE(){
  #$1 --> it will receive the argument

if [$1 -ne 0 ]
then 
   echo "$2 ... FAILURE"
   exit 1
else 
   echo "$2 ... SUCCESS"
fi
}

# it is our responsibility to check installation succes or not
yum install mysql -y

VALIDATE $? "installing mysql" 


yum install postfix -y

VALIDATE $? "installing postfix"