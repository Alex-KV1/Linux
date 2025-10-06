#!/bin/bash
source ./1.sh 
echo $#
if (( $# < 6)); then
    echo 'Введено слишком мало аргументов'
    exit 1
else 
    ch_way $1
    ch_digit $2
    ch_only_letter_nmore_7 $3
    ch_digit $4
    ch_name_file $5
    ch_size_file $6
    
fi

