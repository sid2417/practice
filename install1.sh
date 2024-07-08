R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

LOGFILE="/tmp+$FILENAME+$TIMESTAMP"
FILENAME= echo $0 | cut -d "." -f1
TIMESTAMP= date +%T-%H-%M-%S

dnf install mysql
if [ $? -ne 0 ]
then
    echo -e "$R mysql installation was Failure $N" 
else
    echo -e "$G mysql installation was Success $N" &>>$LOGFILE

fi