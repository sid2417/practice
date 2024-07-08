#?/bin/bash

for i in {1..20}
do 
    echo "$i"
done

for i in {$@}
do 
    echo "Installing Package Name : $i"
    dnf list installed $i
    if [ $i -eq 0 ]
    then
        echo "This is already Installed"
    else
        echo "we need to Install"
    fi

done