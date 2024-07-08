#?/bin/bash

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$Y Please Run With SUDO command $N"
else
    echo -e "$G You Have a SUDO ACCESS $N"
fi

TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=$(echo $0 | awk -F "." {print $1F})
LOGFILE=/tmp/$FILENAME-$TIMESTAMP

VALIDATE( ){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 Failed $N"
    else
        echo -e "$G $2 Installed Successfully $N"
    fi
}


for i in $@
do 
    echo "Package Name : $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$Y This is already Installed....Just SKIPPING $N"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Current Package $i is :"
    fi
done