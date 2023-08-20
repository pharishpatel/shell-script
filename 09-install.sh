!/bin/bash

# our programme goal is install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: please run script with root access"
   exit 1
#else 
#   echo "INFO:: you are root user"
fi

# it is our responsibility to check installation succes or not
yum install mysql -y

if [$? -ne 0 ]
then 
   echo "installation of mysql is error"
   exit 1
else 
   echo "installation of mysql is success"
fi

yum install postfix -y

if [$? -ne 0 ]
then 
   echo "installation of postfix is error"
   exit 1
else 
   echo "installation of postfix is success"
fi
