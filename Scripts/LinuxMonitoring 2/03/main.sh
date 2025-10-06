#!/bin/bash

if [ "$#" -ne 1 ]; 
then
    echo "ERROR: Скрипт запускается с одни обязательным аргументом ввиде цифры от 1-3"
    exit 1
fi

if [ $1 -eq 1 ];
then
    echo "Введи путь до папки с лог файлом logfile"
    read log
    if [ ! -e $log ]; then
        echo "Error: Папка $2 не существует"
    else
        while IFS= read -r line
        do
            if [[ "$line" == *"/"* ]]; then
                line=$(echo "$line" | /bin/awk '{print $1}')
                rm -rf $line
            fi
        done < $log
    fi
elif [ $1 -eq 2 ];
then
    pattern='[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}'
    file_name='[a-z]+_[0-9]{6}'
    echo "Введите время начала поиска в формате YYYY-MM-DD HH:MM"
    read time_start
    echo "Введите время окончания поиска в формате YYYY-MM-DD HH:MM"
    read time_end
    if [[ $time_start =~ $pattern ]] && [[ $time_end =~ $pattern ]]; then
        for var in $(find /home -type d -newerct "$time_start" ! -newerct "$time_end")
        do
            if [[ $var =~ $file_name ]]; then
                rm -rf $var
            fi
        done
    else
        echo "Не вреный формат даты"
    fi
elif [ $3 -eq 3 ];
then
    echo "Введи поисковый шаблон"
    read pattern
    letters=$(echo "${pattern%_*}" | sed 's/\S/&+/g')
    date=${pattern#*_}
    pattern="${letters}_${date}"
    for var in $(find /home | grep -E "$letters_$date")
    do
        rm -rf $var
    done
else
    echo "ERROR: неподдерживаемый тип аргумента"
fi
