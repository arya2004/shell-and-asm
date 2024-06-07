#!/bin/bash


createFile()
{
    local fileONEPATH="$1"
    local fileONE="$2"
    local fileTWOPATH="$3"
    local fileTWO="$4"
    touch $fileONEPATH$fileONE
    touch $fileTWOPATH$fileTWO
}


createFile C:/Users/arya2/source/repos/LinuxCode/lab3/ testinf.js


