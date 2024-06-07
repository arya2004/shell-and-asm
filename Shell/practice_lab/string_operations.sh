#!/bin/bash

# Prompt the user to enter s1
echo "Enter s1"
read s1

# Prompt the user to enter s2
echo "Enter s2"
read s2

# Check if s1 is equal to s2
if [ $s1 == $s2 ]
then
    echo "Match"
else
    echo "No match"
fi

# Check which string is smaller
if [ "$s1" \< "$s2" ]
then
    echo "s1 is smaller"
else
    echo "s2 is smaller"
fi

# Concatenate strings
concatted=$s1$s2

# Convert first character of s1 to uppercase
echo ${s1^}

# Convert all characters of s1 to uppercase
echo ${s1^^}
