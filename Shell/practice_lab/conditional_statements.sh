#!/bin/bash

# Setting a variable 'count' to 10
count=10

# Using an 'if' statement to check if 'count' is greater than 10
if [ $count -gt 10 ]
then 
    echo "sfdf"
else
    echo "not 10"
fi

# Using 'if', 'elif', and 'else' to check multiple conditions
if (( $count < 10 ))
then 
    echo "sfdf"
elif (( $count == 10 ))
then
    echo "not 10"
else
    echo "moew"
fi

# Checking conditions using '&&' (AND) and '||' (OR)
age=12

# Using '&&' to check if 'age' is between 10 and 40
if [ $age -gt 10 ] && [ $age -lt 40 ]
then
    echo "correct"
else
    echo "not"
fi

# Same condition using '[[ ... ]]'
if [[ "$age" -gt 10  &&  "$age" -lt 40 ]]
then
    echo "correct"
else
    echo "not"
fi

# Using '||' to check if 'age' is either greater than 10 or less than 40
if [[ "$age" -gt 10  ||  "$age" -lt 40 ]]
then
    echo "correct"
else
    echo "not"
fi

# Same condition using '||'
if [ $age -gt 10 ] || [ $age -lt 40 ]
then
    echo "correct"
else
    echo "not"
fi
