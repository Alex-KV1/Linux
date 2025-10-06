#!/bin/bash
 way=$1      # Путь
 countD=$2   # Колиичество создоваемых папок
 nameD=$3    # Имя директории
 countF=$4   # Колличество создоваемых файлов
 namefile=$5 # имя файла
 size=$6     #размер
. 1.sh
date=$(get_me_date) #текущая дата

#countD=1000  
#countF=2
#nameD=az
origin=$nameD
len_nameD=${#nameD}
ind=0
min_len=4
step=$((4*len_nameD))
counter=0

for ((i=0; i<countD; i++)); do 
    if [[ $nameD = 'az' || ${nameD:0:2} == 'az' ]]; then
        gname='az'
    else
        gname=''
    fi
    while (( ${#gname} < min_len )); do 
        gname="${gname}${nameD:$((RANDOM % ${#nameD})):1}"
        if (( ${#gname} == $min_len )); then
            ch_fl_exist $way$gname # вызов функции
            if (( $? == 0 )); then # проверяем что вернула функция
                gname=''
                ((counter++)) #от зацикливания
                if (( counter > 100)); then
                    break
                fi
            else
                counter=0
            fi
        fi
    done
    if ((i>step && min_len < 7)); then
        ((min_len++))
        ((step+=4))
    fi
    echo "$i $gname" # $nameD${temp}_$date"
    mkdir $gname




done

