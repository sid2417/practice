#?/bin/bash

for i in {1..20}
do 
    echo "$i"
done

for i in {$@}
do 
    echo "Installing Package Name : $i"
    dnf lint installed $i

done