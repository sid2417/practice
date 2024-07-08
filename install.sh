# installing softwares

echo "Program is starting"

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'
LOGFILE="/tmp+$FILENAME+$TIMESTAMP"
FILENAME= echo file name is $0 | cut -d "." -f1
TIMESTAMP= date +%T-%H-%M-%S
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo -e  "$R You don't have Permissions for SUDO $N"
    exit 1
else
    echo -e "$G You are a SUPER USER $N"
fi


dnf install mysql
VALIDATE $1 $2


VALIDATE(){
if [ $? -ne 0 ]
then
    echo -e "$R mysql installation was Failure $N" 
    exit 2
else
    echo -e "$G mysql installation was Success $N" 

fi
}






