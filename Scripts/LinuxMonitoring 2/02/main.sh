#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "ERROR: Количество аргументов должно быть равно 3 "
    exit 1
fi

avail_size=$(/bin/df -k / | /bin/grep /dev/sdc | /bin/awk '{print $4}')
if [ $avail_size -le 1048576 ]; then
    echo "Error: Недостаточно памяти"
    exit 1
fi

START_TIME_T=$(date +%s%N)
START_TIME=$(date +%H:%M:%S)
error_tg=0
NUMBER='[^0-9]+'
PATTERN='[^a-zA-Z]+'

ch_for_name_dir=$1
no_repeat_cheker_dir=$(echo $ch_for_name_dir | /bin/sed 's/\(.\)\1/\1/g')
if [ ${#ch_for_name_dir} -gt 7 ]
then
    if [[ $error_tg == 1 ]];
    then
        echo
    fi
    echo "ERROR: Количество символов для создания имени папки не должно превышать 7 "
    echo "       Ошибка в агрументе №1: $ch_for_name_dir "
    error_tg=1
elif [[ $ch_for_name_dir =~ $PATTERN ]]
then
    if [[ $error_tg == 1 ]];
    then
        echo
    fi
    echo "ERROR: Для создания названия папки следует использовать только латинские буквы "
    echo "       Ошибка в агрументе №1: $ch_for_name_dir "
    error_tg=1
elif [[ ${#no_repeat_cheker_dir} -ne ${#ch_for_name_dir} ]]
then
    if [[ $error_tg == 1 ]];
    then
        echo
    fi
    echo "ERROR: Буквы для генерации названий папок не должны повторяться"
    echo "       Ошибка в агрументе №1: $ch_for_name_dir "
    error_tg=1
fi

ch_for_file=$2
chr_for_n_fl=${ch_for_file%.*}
ch_for_exp_fl=${ch_for_file#*.}
no_rep_chek_fl_nm=$(echo $chr_for_n_fl | /bin/sed 's/\(.\)\1/\1/g')
no_rep_chr_fl_exp=$(echo $ch_for_exp_fl | /bin/sed 's/\(.\)\1/\1/g')
if [[ ! $ch_for_file == *.* ]];
then
    if [[ $error_tg == 1 ]];
    then
        echo
    fi
    echo "ERROR: Между именем файла и его расширением должна быть точка "
    echo "       Ошибка в агрументе  №2: $ch_for_file "
    error_tg=1
else
    if [ ${#chr_for_n_fl} -gt 7 ]
    then
        if [[ $error_tg == 1 ]];
        then
            echo
        fi
        echo "ERROR: Количество символов для создания имени файла не должно превышать 7 "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        error_tg=1
    elif [[ $chr_for_n_fl =~ $PATTERN ]]
    then
        if [[ $error_tg == 1 ]];
        then
            echo
        fi
        echo "ERROR: Для создания имени файла следует использовать только латинские буквы "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        error_tg=1
    elif [[ ${#no_rep_chek_fl_nm} -ne ${#chr_for_n_fl} ]]
    then
        if [[ $error_tg == 1 ]];
        then
            echo
        fi
        echo "ERROR: Буквы для генерации имен файлов не должны повторяться "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        error_tg=1
    fi

    if [ ${#ch_for_exp_fl} -gt 3 ]
    then
        if [[ $error_tg == 1 ]];
        then
            echo
        fi
        echo "ERROR: Количество символов для создания расширения файла не должно превышать 3 "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        error_tg=1
    elif [[ $ch_for_exp_fl =~ $PATTERN ]]
    then
        if [[ $error_tg == 1 ]];
        then
            echo
        fi
        echo "ERROR: Для создания расширения файла следует использовать только латинские буквы "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        error_tg=1
    elif [[ ${#no_rep_chr_fl_exp} -ne ${#ch_for_exp_fl} ]]
    then
        if [[ $error_tg == 1 ]];
        then
            echo
        fi
        echo "ERROR: Буквы для создания расширения файла не должны повторяться "
        echo "       Ошибка в агрументе  №2: $ch_for_file "
        error_tg=1
    fi
fi

size_file=$3
size_num_files=${size_file%Mb*}
if [[ $size_num_files =~ $NUMBER || ! $size_file == *Mb ]]; 
then
    if [[ $error_tg == 1 ]];
    then
        echo
    fi
    echo "ERROR: Размер файла должен быть указан в виде количества Мб и подписи после этого. "
    echo "       Ошибка в агрументе  №3: $size_file "
    error_tg=1
elif [ $size_num_files -gt 100 ]; 
then
    if [[ $error_tg == 1 ]];
    then
        echo
    fi
    echo "ERROR: Объем памяти для файла не должен превышать 100 Mb "
    echo "       Ошибка в агрументе  №3: $size_file "
    error_tg=1
fi

if [[ $error_tg != 1 ]];
then
    /bin/touch "logger.log"
    data="_$(/bin/date +"%d%m%y")"
    number_of_subfolders=$(($RANDOM%100))
    for (( i=1; i<=${number_of_subfolders}; i++ )) do
        avail_size=$(/bin/df -k / | /bin/grep /dev/sdc | /bin/awk '{print $4}')
        if [ $avail_size -le 1048576 ]; then
            echo "Error: Недостаточно памяти"
            break
        fi
        path="$(find /home -type d 2>/dev/null | grep -E '[^(bin|sbin)]' | head -n$(($RANDOM%650)) | tail -n1)/"
        name_dir="$(/bin/bash gen.sh $ch_for_name_dir $i)"
        /bin/mkdir "${path}${name_dir}${data}"
        echo -e "${path}${name_dir}${data}/\t\t\t\t\t$(/bin/date +"%d.%m.%y")" >> logger.log
        number_of_file=$(($RANDOM%100))
        for (( j=1; j<=${number_of_file}; j++ )) do
            avail_size=$(/bin/df -k / | /bin/grep /dev/sdc | /bin/awk '{print $4}')
            if [ $avail_size -le 1048576 ]; then
                echo "Error: Недостаточно памяти"
                break
            fi
            name_file="$(/bin/bash gen.sh $chr_for_n_fl $((j)))"
            /bin/fallocate -l ${size_file} "${path}${name_dir}${data}/${name_file}${data}.${ch_for_exp_fl}"
            echo -e "${path}${name_dir}${data}/${name_file}${data}.${ch_for_exp_fl}\t$(/bin/date +"%d.%m.%y") ${size_num_files}" >> logger.log
        done
    done
    END_TIME=$(date +%H:%M:%S)
    END_TIME_NANOSEC=$(date +%s%N)
    echo "Start time: $START_TIME"
    echo "End time: $END_TIME"
    echo "Total workong time: $((($END_TIME_NANOSEC - $START_TIME_T)/1000000000)) seconds"
    echo "Start time: $START_TIME" >> logger.log
    echo "End time: $END_TIME" >> logger.log
    echo "Total workong time: $((($END_TIME_NANOSEC - $START_TIME_T)/1000000000)) seconds" >> logger.log
fi