#?/bin/bash

VALIDATE( ){
    if [ $1 -ne 0 ]
    then
        echo "$2 Failed"
    else
        echo "$2 Installed Successfully"
    fi
}


for i in $@
do 
    echo "Package Name : $i"
    dnf list installed $i
    if [ $? -eq 0 ]
    then
        echo "This is already Installed....Just SKIPPING"
    else
        dnf install $i -y
        VALIDATE $? "Current Package $i is :"
    fi
done