# installing softwares

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'
FILENAME= echo $0 | cut -d "." -f1
TIMESTAMP="date +%T-%H-%M-%S"
LOGFILE="/tmp+$FILENAME+$TIMESTAMP"
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo -e  "$R You don't have Permissions for SUDO $N"
else
    echo -e "$G You are a SUPER USER $N"
fi

dnf install mysql
if [ $? -ne 0 ]
then
    echo -e "$R mysql installation was Failure $N" &>>$LOGFILE
else
    echo -e "$G mysql installation was Success $N" &>>$LOGFILE

fi

