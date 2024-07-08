# installing softwares

echo "Program is starting"

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

FILENAME=$(echo file name is $0 | cut -d "." -f1)
TIMESTAMP=$(date +%T-%H-%M-%S)
LOGFILE=/tmp/$FILENAME-$TIMESTAMP.log
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo -e  "$R You don't have Permissions for SUDO $N"
    exit 1
else
    echo -e "$G You are a SUPER USER $N"
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2  Failure $N" 
    exit 2
else
    echo -e "$2  Success $N" 

fi
}

dnf install mysql &>>$LOGFILE
VALIDATE $? "Installing MySql is : "









