#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "ERROR: Должен быть передан один аргумент"
    exit 1
fi


log_file="access1.log"

if [ ! -f "$log_file" ]; then
    echo "ERROR: Файл $log_file не найден"
    exit 1
fi


process_sort() {
    awk '{ print }' "$log_file" | sort -k 9
}
process_unique_ips() {
    awk '{ print $1 }' "$log_file" | uniq
}
process_error_codes() {
    awk '/400|401|403|404|500|501|502|503/{ s = ""; for (i = 7; i <= 9; i++) s = s $i " "; print s }' "$log_file"
}
process_error_ips() {
    awk '/400|401|403|404|500|501|502|503/{ print $1 " " $9 }' "$log_file" | sort | uniq
}

case $1 in
    1) process_sort ;;
    2) process_unique_ips ;;
    3) process_error_codes ;;
    4) process_error_ips ;;
    *) echo "ERROR: Неподдерживаемый тип аргумента" ;;
esac
