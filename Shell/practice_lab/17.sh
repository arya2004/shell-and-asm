#!/bin/bash

function moew()
{
    echo "moew! $1"
}

function yett()
{
    ret
}

#moew qww

#mkdir -p Dir
#rmdir Dir
a=Dir

if [ -d "$a" ]
then 
    echo "exist"
else    
    echo "now"
fi

touch fil
b=fil

if [[ -f "$a" ]]
then 
    echo "exist fil"
else    
    echo "now fil"
fi
