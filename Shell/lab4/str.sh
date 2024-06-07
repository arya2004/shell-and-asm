#!/bin/bash


read -p "enter string 1:  " String_1
echo $String_1

read -p "enter string two:  " String_2
echo $String_2

Len_One=${#String_1}
Len_Two=${#String_2}
echo "str one len: "
echo $Len_One
echo "str two len: "
echo $Len_Two

if[$Len_One -gt $Len_Two]
    echo "first biggher"
fi

if[$Len_One -lt $Len_Two]
    echo "second biggher"
fi