#!/bin/bash


createFolder()
{
    read -p "Enter folder 1 path: " folderONEPATH
    read -p "Enter folder 1 name: " folderONE
    read -p "Enter folder 2 path: " folderTWOPATH
    read -p "Enter folder 2 name: " folderTWOPATH
    mkdir $fileONEPATH$fileONE
    mkdir $fileTWOPATH$fileTWO
}


createFolder C:/Users/arya2/source/repos/LinuxCode/lab3/ testinf.sh


