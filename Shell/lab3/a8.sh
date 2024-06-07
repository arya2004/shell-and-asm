#!/bin/bash


biggestNumber()
{
    local num1="$1"
    local num2="$2"
    local num3="$3"
    if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]; then
        largest=$num1
    elif [ $num2 -gt $num1 ] && [ $num2 -gt $num3 ]; then
        largest=$num2
    else
        largest=$num3
    fi

    echo "The largest number is: $largest"
}


biggestNumber 2 4 6