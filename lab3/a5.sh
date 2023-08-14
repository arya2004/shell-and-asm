#!/bin/bash


createFile()
{
    local folderONEPATH="$1"
    local folderONE="$2"
    local folderTWOPATH="$3"
    local folderTWO="$4"
    mkdir $folderONEPATH$folderONE
    mkdir $folderTWOPATH$folderTWO
}


createFile C:/Users/arya2/source/repos/LinuxCode/lab3/ testinf.sh


