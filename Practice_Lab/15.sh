#!/bin/bash

#ls -al 1>file1.txt  2>errorfile.txt

#same file
#ls -al >&file1.txt

echo "enter s1"
read s1

echo "enter s2"
read s2

if [ $s1 == $s2 ]
then
    echo "machy"
else
    echo "notty"
fi

#smol

if [ "$s1" \< "$s2" ]
then
    echo "s1 smiol"
else
    echo "s2 smol"
fi

#concat
concatty=$s1$s2

#lower then uppercase
echo ${s1^}
echo ${s1^^}