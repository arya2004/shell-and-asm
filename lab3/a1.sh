#!/bin/bash


longlist() {
    local pathOfFile="$1"
    ls  $pathOfFile
   
}

getDate()
{
    date
}

print()
{
    local string="$1"
    clear
    echo $string
}


longlist C:/Users/arya2/desktop
getDate
sleep 2
print "hello world"


