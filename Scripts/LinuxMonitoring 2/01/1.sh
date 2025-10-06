#!/bin/bash

function ch_way {
    if [[ $1 =~ ^(/[^/[:space:]]+)*$ || $1 == '/' ]]; then
        if [[ $1 == '/' || -d "$1" ]]; then
            # echo  ok
            return 0
        else
            echo "Указанной директории $1 не существует"
            exit 1
        fi
    else
        echo "Введенный вами путь \" $1 \" не соответсвует"
        exit 1
    fi
}

function ch_digit {
    if [[ $1 =~ ^[0-9]+$ ]]; then
        echo ok
        return 0
    else
        echo Введен не верный параметр ожидаем число а не $1
        return 1
    fi
}

function ch_only_letter_nmore_7 {
    if [[ $1 =~ ^[A-Za-z]+$ ]]; then
        if (( ${#1} <= 7 )); then
            # echo ok
            return 0
        else
            echo "Введенной вами строка \" $1 \" имеет длинну более 7 символов"
            return 1
        fi
    else
        echo "Введен неверный формат строки \" $1 \""
        return 1
    fi
}


function ch_size_file {
    var=$1
    if ch_digit "$1" ; then
        if (( $1 > 100 )); then
            echo "Введено число более 100kb"
            return 1
        fi 
    else
        echo "Введен неверный размер он должен быть числом а не \" $1 "\"
        return 1
    fi
   
}



function ch_name_file {
    if [[ $1 =~ ^[A-Za-z0-9]{1,7}\.{1}[A-Za-z0-9]{1,3}$ ]]; then
        # echo ok
        return 0
    else
        echo Введенная строка для имени файла не соответсвует правилам!
    fi
    # first=$(echo "$1" | awk -F. '{print $1}')
    # second=$(echo "$1" | awk -F. '{print $2}')
    # echo $first
    # echo $second
}

function ch_free_space {
    size=$(df -k / | awk 'NR==2 {print $4}')
    if [[ $size -le 1048576 ]]; then
        echo "В указаном разделе / менее 1 GB свободного пространства. Скрипт остановлен!"
        exit 1
    fi
}

function get_me_date {
    echo $(date +%d%m%y)
}

function ch_fl_exist {
    # echo "param $1"
    if [[ -d $1 && $1 != '' ]]; then
        echo "ok"
        return 0
    fi
    echo "not ok"
    return 1
}
