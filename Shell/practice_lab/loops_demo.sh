#!/bin/bash

count=0

# While loop to print numbers from 0 to 9
while [ $count -lt 10 ]
do
    echo "$count"
    count=$(( count+1 ))
done

# Until loop to print numbers from 10 to 15
until [ $count -lt 15 ]
do
    echo "$count"
    count=$(( count-1 ))
done

# For loop to print numbers from a list
for i in 10 20 30 40 50
do  
    echo $i
done

# For loop using range and increment
for i in {0..100..10}
do  
    echo $i
done

# For loop with a conditional check and break statement
for (( i=0; i<=10; i++ ))
do  
    if [ $i -eq 5 ]
    then  
        echo "phive"
        break
    fi
    echo $i
done

# For loop with a conditional check and continue statement
for (( i=0; i<=10; i++ ))
do  
    if [ $i -eq 5 ] || [ $i -eq 7 ]
    then  
        echo "phive"
        continue
    fi
    echo $i
done
