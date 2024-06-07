#!/bin/bash

count=0

while [ $count -lt 10 ]
do
    echo "$count"
    count=$(( count+1 ))
   
done

until [ $count -lt 15 ]
do
    echo "$count"
    count=$(( count-1 ))
   
done

for i in 10 20 30 40 50
do  
    echo $i
done

#{start..end..increment}
for i in {0..100..10}
do  
    echo $i
done

for (( i=0; i<=10; i++ ))
do  
    if [ $i -eq 5 ]
    then  
        echo "phive"
        break
    fi
    echo $i
done

for (( i=0; i<=10; i++ ))
do  
    if [ $i -eq 5 ] || [ $i -eq 7 ]
    then  
        echo "phive"
        continue
    fi
    echo $i
done