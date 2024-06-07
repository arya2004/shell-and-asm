#!/bin/bash

# Prompt user to enter two strings and display them
read -p "Enter string 1: " String_1
echo "String 1: $String_1"

read -p "Enter string 2: " String_2
echo "String 2: $String_2"

# Calculate and display the lengths of the strings
Len_One=${#String_1}
Len_Two=${#String_2}
echo "Length of String 1: $Len_One"
echo "Length of String 2: $Len_Two"

# Compare the lengths of the strings and display the result
if [ $Len_One -gt $Len_Two ]; then
    echo "String 1 is longer"
fi

if [ $Len_One -lt $Len_Two ]; then
    echo "String 2 is longer"
fi
