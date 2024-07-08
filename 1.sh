#?/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run with SUDO command"
else
    echo "You Have SUDO ACCESS"
fi

dnf install mysqld -y