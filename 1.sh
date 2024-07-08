#?/bin/bash


USERID=$(id -u)
R='\e[31m'
G='\e[32m'
N='\e[0m'

FILENAME=$(echo $0 | awk -F "." '{print $1F}')
TIMESTAMP=$(date +%T-%H-%M-%S)
LOGFILE=/tmp/$FILENAME-$TIMESTAMP

if [ $USERID -ne 0 ]
then
    echo -e "$R Please run with SUDO command $N"
else
    echo -e "$G You Have SUDO ACCESS $N"
fi

VALIDATE( ){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 Failed $N"
         exit 1
    else
        echo -e "$G $2 Success $N"
    fi

}

dnf install mysql -y &>>$LOGFILE
if [ $? -ne 0 ]
then
    echo -e "$R Installation going BAD $N"
    exit 1
else
    echo -e "$G mysql installation going Good $N"
fi

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installation is : "


for i in (1..20)
do 
    echo "$i"
done