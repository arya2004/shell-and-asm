#!/bin/bash


multipleFiles()
{
    for i in 1 2 3; do
    filename="f$i"
    touch "$filename"
    echo "Created $filename"
    done
}


multipleFiles