#!/bin/bash

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$FILENAME-$TIMESTAMP

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo -e "$Y Please Run this Command with SUDO $N"
    exit 4
else
    echo -e "$G You Have already SUDO ACCESS $N"
fi

VALIDATE(){
     if [ $1 -ne 0 ]
    then 
        echo -e "$Y $2 FAILURE $N"
        exit 2
    else
        echo -e "$G $2 SUCCESS $N"
    fi
}

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Mysql Installation is :"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling Mysql is :"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting Mysql is :"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "Setup Mysql Password is :"
