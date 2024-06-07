#!/bin/bash


#add
a=34
b=4
echo $(( a + b ))
echo $(( a - b ))
echo $(( a * b ))
echo $(( a / b ))
echo $(( a % b ))

echo $(expr $a + $b)
echo $(expr $a \* $b)

#hex to dec

echo "enter hex"
read hex
echo "obase=10; ibase=16; $hex" | bc


#array
car=('bmw' 'toyota' 'honda')
echo "${car[0]}"
#indexes
echo "${!car[@]}"
#total count
echo "${#car[@]}"

unset car[2]
car[2]='tataa'
echo "${car[@]}"