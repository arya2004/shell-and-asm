#!/bin/bash

count=10

#conditions
#keep 1 space from both sides ab\nd after if

if [ $count -gt 10 ]
then 
    echo "sfdf"
else
    echo "not 10"
fi

#beloew only works with bash 12.sh

if (( $count < 10 ))
then 
    echo "sfdf"
elif (( $count == 10 ))
then
    echo "not 10"
else
    echo "moew"
fi

#double
age=12

if [ $age -gt 10 ] && [ $age -lt 40 ]
then
    echo "corect"
else
    echo "not"
fi

# same as above

if [[ "$age" -gt 10  &&  "$age" -lt 40 ]]
then
    echo "corect"
else
    echo "notsdf"
fi

#OR

if [[ "$age" -gt 10  ||  "$age" -lt 40 ]]
then
    echo "corect"
else
    echo "notsdf"
fi


if [ $age -gt 10 ] || [ $age -lt 40 ]
then
    echo "corect"
else
    echo "not"
fi
