#!/bin/bash

# countwords()
# {
#     MAIN_STRING="hello every one, i am atyr pathal"
#     WORD_COUNT=0

#     for var in $MAIN_STRING
#         do 
#             WORD_COUNT=$((WORD_COUNT+1))
#         done

#     echo $WORD_COUNT
# }

countwordscli()
{
    MAIN_STRING=$1
    #MAIN_STRING=$1
    WORD_COUNT=0

    for var in $MAIN_STRING
        do 
            WORD_COUNT=$((WORD_COUNT+1))
        done

    echo $WORD_COUNT
}

countspecific()
{
    MAIN_STRING="hello the every one, the  i am  the atyr pathal"
    WORD="the"
    WORD_COUNT=0

    for var in $MAIN_STRING
    do 
    
        case $WORD in
        $var) WORD_COUNT=$((WORD_COUNT+1));;
        esac
    done
    echo $WORD_COUNT
}

countspecific2()
{
    MAIN_STRING= app.txt
    WORD="the"
    WORD_COUNT=0

    for var in $MAIN_STRING
    do 
    
        case $WORD in
        $var) WORD_COUNT=$((WORD_COUNT+1));;
        esac
    done
    echo $WORD_COUNT
}




 countspecific2 

 


