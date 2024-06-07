#!/bin/bash


renameFile()
{
    read -p "Enter file path: " filePATH
    read -p "Enter old name: " OLD_NAME
    read -p "Enter new name: " NEW_NAME
    mv $filePATH$OLD_NAME $filePATH$NEW_NAME

}


renameFile


