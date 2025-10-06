#!/bin/bash

pattern=$1
size_of_pattern=${#name_sim}
caunter_gen=$2
counter_1=1
counter_2=1
counter_3=1
counter_4=1
counter_5=1
counter_6=1
counter_7=1
if [[ $size_of_pattern -eq 1 ]]; 
then
    name=$name_sim
    for (( i=-2; i<$caunter_gen; i++ )) do
        name+=$name_sim
    done
elif [[ $size_of_pattern -eq 2 ]]; 
then
    counter_1=2
    counter_2=3
    for (( i=1; i<$caunter_gen; i++ )) do
        if [ $counter_1 -gt $counter_2 ];
        then
            let counter_2++
            counter_1=1
        else
            let counter_1++
        fi
    done
    for (( i=0; i<$( expr $counter_1 + $counter_2 ); i++ )) do
        if [ $i -lt $counter_1 ];
        then
            name+="${pattern:0:1}"
        else
            name+="${pattern:1:1}"
        fi
    done
elif [[ $size_of_pattern -eq 3 ]];
then
    counter_1=2
    counter_3=2
    for (( i=1; i<$caunter_gen; i++ )) do
        if [ $counter_2 -gt $counter_3 ];
        then
            let counter_3++
            counter_2=1
            counter_1=1
        elif [ $counter_1 -gt $counter_2 ];
        then
            let counter_2++
            counter_1=1
        else
            let counter_1++
        fi
    done
    for (( i=0; i<$( expr $counter_1 + $counter_2 + $counter_3 ); i++ )) do
        if [ $i -lt $counter_1 ];
        then
            name+="${pattern:0:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 ) ];
        then
            name+="${pattern:1:1}"
        else
            name+="${pattern:2:1}"
        fi
    done
elif [[ $size_of_pattern -eq 4 ]];
then
    counter_1=2
    for (( i=1; i<$caunter_gen; i++ )) do
        if [ $counter_3 -gt $counter_4 ];
        then
            let counter_4++
            counter_3=1
            counter_2=1
            counter_1=1
        elif [ $counter_2 -gt $counter_3 ];
        then
            let counter_3++
            counter_2=1
            counter_1=1
        elif [ $counter_1 -gt $counter_2 ];
        then
            let counter_2++
            counter_1=1
        else
            let counter_1++
        fi
    done
    for (( i=0; i<$( expr $counter_1 + $counter_2 + $counter_3 + $counter_4 ); i++ )) do
        if [ $i -lt $counter_1 ];
        then
            name+="${pattern:0:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 ) ];
        then
            name+="${pattern:1:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 + $counter_3 ) ];
        then
            name+="${pattern:2:1}"
        else
            name+="${pattern:3:1}"
        fi
    done
else
    if [ $size_of_pattern -eq 5 ]
    then
        counter_6=0
        counter_7=0
    elif [ $size_of_pattern -eq 6 ]
    then
        counter_7=0
    fi
    for (( i=1; i<$caunter_gen; i++ )) do
        if [ $size_of_pattern -eq 7 ] && [ $counter_6 -gt $counter_7 ];
        then
            let counter_7++
            counter_6=1
            counter_5=1
            counter_4=1
            counter_3=1
            counter_2=1
            counter_1=1
        elif [ $size_of_pattern -gt 5 ] && [ $counter_5 -gt $counter_6 ];
        then
            let counter_6++
            counter_5=1
            counter_4=1
            counter_3=1
            counter_2=1
            counter_1=1
        elif [ $counter_4 -gt $counter_5 ];
        then
            let counter_5++
            counter_4=1
            counter_3=1
            counter_2=1
            counter_1=1
        elif [ $counter_3 -gt $counter_4 ];
        then
            let counter_4++
            counter_3=1
            counter_2=1
            counter_1=1
        elif [ $counter_2 -gt $counter_3 ];
        then
            let counter_3++
            counter_2=1
            counter_1=1
        elif [ $counter_1 -gt $counter_2 ];
        then
            let counter_2++
            counter_1=1
        else
            let counter_1++
        fi
    done
    for (( i=0; i<$( expr $counter_1 + $counter_2 + $counter_3 + $counter_4 + $counter_5 + $counter_6 + $counter_7); i++ )) do
        if [ $i -lt $counter_1 ];
        then
            name+="${pattern:0:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 ) ];
        then
            name+="${pattern:1:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 + $counter_3 ) ];
        then
            name+="${pattern:2:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 + $counter_3 + $counter_4 ) ];
        then
            name+="${pattern:3:1}"
        elif [ $i -lt $( expr $counter_1 + $counter_2 \
             + $counter_3 + $counter_4 + $counter_5 ) ];
        then
            name+="${pattern:4:1}"
        elif [ $size_of_pattern -gt 5 ] && [ $i -lt $( expr $counter_1 + $counter_2 \
             + $counter_3 + $counter_4 + $counter_5 + $counter_6 ) ];
        then
            name+="${pattern:5:1}"
        elif [ $size_of_pattern -eq 7 ];
        then
            name+="${pattern:6:1}"
        fi
    done
fi
echo $name