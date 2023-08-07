#!/bin/bash


createFile()
{
    read -p "Enter file 1 path: " fileONEPATH
    read -p "Enter file 1 name: " fileONE
    read -p "Enter file 2 path: " fileTWOPATH
    read -p "Enter file 2 name: " fileTWOPATH
    touch $fileONEPATH$fileONE
    touch $fileTWOPATH$fileTWO
}


createFile C:/Users/arya2/source/repos/LinuxCode/lab3/ testinf.sh


