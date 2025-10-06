#!/bin/bash

echo
echo ████████╗███████╗░██████╗████████╗░██████╗
echo ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝
echo ░░░██║░░░█████╗░░╚█████╗░░░░██║░░░╚█████╗░
echo ░░░██║░░░██╔══╝░░░╚═══██╗░░░██║░░░░╚═══██╗
echo ░░░██║░░░███████╗██████╔╝░░░██║░░░██████╔╝
echo ░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═════╝░

echo
echo
echo "**************"
echo Тесты №1"     *"
echo "**************"
echo Ожидаемый вывод identical тесты с комбинацяими ключей
echo без ключей
diff <(grep Привет test) <(./s21_grep Привет test) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-n "
diff <(grep Привет test -n) <(./s21_grep Привет test -n) -s -q
diff <(grep -n Привет test) <(./s21_grep -n Привет test) -s -q
echo ключь -v
diff <(grep -v Привет test) <(./s21_grep -v Привет test) -s -q
echo ключь -v -n
diff <(grep -vn Привет test) <(./s21_grep -vn Привет test) -s -q
echo ключь -i -n
diff <(grep -i -n KITCHEN test) <(./s21_grep -i -n KITCHEN test) -s -q
echo ключь -e
diff <(grep test -e Привет) <(./s21_grep test -e Привет) -s -q
echo ключь -e -v 
diff <(grep -v test -e Привет) <(./s21_grep -v test -e Привет) -s -q
echo ключь -e -v -n
diff <(grep -v test -e Привет -n) <(./s21_grep -v test -e Привет -n) -s -q
echo ключь -e -n
diff <(grep -v test -e Привет) <(./s21_grep -v test -e Привет) -s -q
echo ключь -i
diff <(grep -i KITCHEN test ) <(./s21_grep -i KITCHEN test) -s -q
echo тоже самое но без кюча -i
diff <(grep KITCHEN test ) <(./s21_grep KITCHEN test) -s -q
echo ключь -i -v 
diff <(grep -i -v KITCHEN test) <(./s21_grep -i -v KITCHEN test) -s -q
echo ключь -i -v -n
diff <(grep -i -v -n KITCHEN test) <(./s21_grep -i -v -n KITCHEN test) -s -q
echo ключь -i -v -n -l
diff <(grep -i -v -n -l KITCHEN test) <(./s21_grep -i -v -n -l KITCHEN test) -s -q
echo ключь -l
diff <(grep -l Привет test) <(./s21_grep -l Привет test) -s -q
echo ключь -n -l
diff <(grep -n -l Привет test) <(./s21_grep -n -l Привет test) -s -q
echo ключь -v -l
diff <(grep -v -l Привет test) <(./s21_grep -v -l Привет test) -s -q
echo ключь -e -l
diff <(grep test -e Привет -l) <(./s21_grep test -e Привет -l) -s -q
echo ключь -i -l
diff <(grep -i -l KITCHEN test ) <(./s21_grep -i -l KITCHEN test) -s -q
echo ключь -c 
diff <(grep -c Привет test) <(./s21_grep -c Привет test) -s -q
echo ключь -c -l
diff <(grep -c -l Привет test) <(./s21_grep -c -l Привет test) -s -q
echo ключь -c -i
diff <(grep -c -i KITCHEN test) <(./s21_grep -c -i KITCHEN test) -s -q
echo ключь -c -n
diff <(grep -c -n Привет test) <(./s21_grep -c -n Привет test) -s -q
echo ключь -c -v
diff <(grep -c -v Привет test) <(./s21_grep -c -v Привет test) -s -q
echo ключь -c -e
diff <(grep -c -e Привет test) <(./s21_grep -c -e Привет test) -s -q
echo ключь -c -v -n -e
diff <(grep -c -v -n -e Привет test) <(./s21_grep -c -v -n -e Привет test) -s -q
echo ключь -c -v -n -i -e
diff <(grep -c -v -n -i -e KITCHEN test) <(./s21_grep -c -v -n -i -e KITCHEN test) -s -q
echo флаг -h
diff <(grep -h kitchen test) <(./s21_grep -h kitchen test) -s -q
echo флаг -h -v
diff <(grep -h -v kitchen test) <(./s21_grep -h -v kitchen test) -s -q
echo флаг -h -c
diff <(grep -h -c kitchen test) <(./s21_grep -h -c kitchen test) -s -q
echo флаг -h -n
diff <(grep -h -n kitchen test) <(./s21_grep -h -n kitchen test) -s -q
echo флаг -h -l
diff <(grep -h -l kitchen test) <(./s21_grep -h -l kitchen test) -s -q
echo флаг -h -i
diff <(grep -h -i KITCHEN test) <(./s21_grep -h -i KITCHEN test) -s -q
echo флаг -h -e
diff <(grep -h -e kitchen test) <(./s21_grep -h -e kitchen test) -s -q
echo флаг -h -i -e
diff <(grep -h -i -e KITCHEN test) <(./s21_grep -h -i -e KITCHEN test) -s -q
echo флаг -h -c -v -l
diff <(grep -h -c -v -l kitchen test) <(./s21_grep -h -c -v -l kitchen test) -s -q
echo флаг -h -c -v -e
diff <(grep -h -c -v -e kitchen test) <(./s21_grep -h -c -v -e kitchen test) -s -q
echo флаг -h -n -v -l
diff <(grep -h -n -v -l kitchen test) <(./s21_grep -h -n -v -l kitchen test) -s -q
echo флаг -o
diff <(grep -o kitchen test) <(./s21_grep -o kitchen test) -s -q
echo флаг -o -h
diff <(grep -o -h kitchen test) <(./s21_grep -o -h kitchen test) -s -q
echo флаг -o -v
diff <(grep -o -v kitchen test) <(./s21_grep -o -v kitchen test) -s -q
echo флаг -o -c
diff <(grep -o -c kitchen test) <(./s21_grep -o -c kitchen test) -s -q
echo флаг -o -n
diff <(grep -o -n kitchen test) <(./s21_grep -o -n kitchen test) -s -q
echo флаг -o -l
diff <(grep -o -l kitchen test) <(./s21_grep -o -l kitchen test) -s -q
echo флаг -o -i
diff <(grep -o -i KITCHEN test) <(./s21_grep -o -i KITCHEN test) -s -q
echo флаг -o -e
diff <(grep -o -e kitchen test) <(./s21_grep -o -e kitchen test) -s -q
echo флаг -o -i -e
diff <(grep -o -i -e KITCHEN test) <(./s21_grep -o -i -e KITCHEN test) -s -q
echo флаг -o -i -e
diff <(grep -o -i -e KITCHEN test) <(./s21_grep -o -i -e KITCHEN test) -s -q
echo флаг -o -h -i -e
diff <(grep -o -h -i -e KITCHEN test) <(./s21_grep -o -h -i -e KITCHEN test) -s -q
echo флаг -o -h -c -v -l
diff <(grep -o -h -c -v -l kitchen test) <(./s21_grep -o -h -c -v -l kitchen test) -s -q
echo флаг -o -h -c -v -e
diff <(grep -o -h -c -v -e kitchen test) <(./s21_grep -o -h -c -v -e kitchen test) -s -q
echo флаг -o -h -n -v -l
diff <(grep -o -h -n -v -l kitchen test) <(./s21_grep -o -h -n -v -l kitchen test) -s -q
echo флаг -f
diff <(grep -f test_string test) <(./s21_grep -f test_string test) -s -q
echo флаг -o -f
diff <(grep -o -f test_string test) <(./s21_grep -o -f test_string test) -s -q
echo флаг -f -h
diff <(grep -h -f test_string test) <(./s21_grep -h -f test_string test) -s -q
echo флаг -f -v
diff <(grep -v -f test_string test) <(./s21_grep -v -f test_string test) -s -q
echo флаг -f -c
diff <(grep -c -f test_string test) <(./s21_grep -c -f test_string test) -s -q
echo флаг -f -n
diff <(grep -n -f test_string test) <(./s21_grep -n -f test_string test) -s -q
echo флаг -f -l
diff <(grep -l -f test_string test) <(./s21_grep -l -f test_string test) -s -q
echo флаг -f -i
diff <(grep -i -f str_test test) <(./s21_grep -i -f str_test test) -s -q
echo флаг -o -f -i
diff <(grep -o -i -f str_test test) <(./s21_grep -o -i -f str_test test) -s -q
echo флаг -o -i -n
diff <(grep -o -i -n -f str_test test) <(./s21_grep -o -i -n -f str_test test) -s -q
echo флаг -o -h -i 
diff <(grep -o -h -i -f str_test test) <(./s21_grep -o -h -i -f str_test test) -s -q
echo флаг -o -h -c -v -l -f
diff <(grep -o -h -c -v -l -f test_string test) <(./s21_grep -o -h -c -v -l -f test_string test) -s -q
echo флаг -o -h -c -v -f
diff <(grep -o -h -c -v -f test_string test) <(./s21_grep -o -h -c -v -f test_string test) -s -q
echo флаг -o -h -n -v -l -f
diff <(grep -o -h -n -v -l -f test_string test) <(./s21_grep -o -h -n -v -l -f test_string test) -s -q




echo
echo "**************"
echo Тесты №2"     *"
echo "**************"
echo Ожидаемый вывод identical тесты с комбинацяими ключей и множественными файлами
echo без ключей
diff <(grep Привет test test1 test2 test3 ) <(./s21_grep Привет test test1 test2 test3) -s -q
echo ключь -n
diff <(grep Привет test test1 test2 test3 -n) <(./s21_grep Привет test test1 test2 test3 -n) -s -q
diff <(grep -n Привет test test1 test2 test3) <(./s21_grep -n Привет test test1 test2 test3) -s -q
echo ключь -n -l
diff <(grep -n -l Привет test test1 test2 test3) <(./s21_grep -n -l Привет test test1 test2 test3) -s -q
echo ключь -n -e
diff <(grep -n -e Привет test test1 test2 test3) <(./s21_grep -n -e Привет test test1 test2 test3) -s -q
echo ключь -n -v
diff <(grep -n -v Привет test test1 test2 test3) <(./s21_grep -n -v Привет test test1 test2 test3) -s -q
echo ключь -n -i
diff <(grep -n -i KITCHEN test test1 test2 test3) <(./s21_grep -n -i KITCHEN test test1 test2 test3) -s -q
echo ключь -v
diff <(grep -v Привет test test1 test2 test3) <(./s21_grep -v Привет test test1 test2 test3) -s -q
echo ключь -v -n
diff <(grep -v -n Привет test test1 test2 test3) <(./s21_grep -n -v Привет test test1 test2 test3) -s -q
echo ключь -v -l
diff <(grep -v -l Привет test test1 test2 test3) <(./s21_grep -v -l Привет test test1 test2 test3) -s -q
echo ключь -e
diff <(grep test test1 -e Привет test2 test3) <(./s21_grep test test1 -e Привет test2 test3) -s -q
echo ключь -e -v 
diff <(grep -v test -e Привет test1 test2 test3) <(./s21_grep -v test -e Привет test1 test2 test3) -s -q
echo ключь -e -v -n
diff <(grep -v test2 test3 -e Привет -n test test1) <(./s21_grep -v test2 test3 -e Привет -n test test1) -s -q
echo тоже самое но без кюча -i
diff <(grep KITCHEN test test1 test2 test3) <(./s21_grep KITCHEN test test1 test2 test3) -s -q
echo ключь -i -v -n -e
diff <(grep -i -v -n test test1 test2 -e KITCHEN test3) <(./s21_grep -i -v -n test test1 test2 -e KITCHEN test3) -s -q
echo ключь -i -v -n -e -l
diff <(grep -i -v -n -l test test1 test2 -e KITCHEN test3) <(./s21_grep -i -v -n -l test test1 test2 -e KITCHEN test3) -s -q
echo ключь -v -n -l
diff <(grep -v -n -l Привет test test1 test2 test3) <(./s21_grep -n -v -l Привет test test1 test2 test3) -s -q
echo ключь -i
diff <(grep -i KITCHEN test test1 test2 test3) <(./s21_grep -i KITCHEN test test1 test2 test3) -s -q
echo ключь -i -l
diff <(grep -i -l KITCHEN test test1 test2 test3) <(./s21_grep -i -l KITCHEN test test1 test2 test3) -s -q
echo ключь -i -e
diff <(grep -i  test test1 test2 -e KITCHEN test3) <(./s21_grep -i test test1 test2 -e KITCHEN test3) -s -q
echo ключь -i -n
diff <(grep -i -n KITCHEN test test1 test2 test3) <(./s21_grep -i -n KITCHEN test test1 test2 test3) -s -q
echo ключь -i -v
diff <(grep -i -v KITCHEN test test1 test2 test3) <(./s21_grep -i -v KITCHEN test test1 test2 test3) -s -q
echo ключь -l -n
diff <(grep -n -l Привет test test1 test2 test3) <(./s21_grep -n -l Привет test test1 test2 test3) -s -q
echo ключь -l -e
diff <(grep -l  test test1 test2 -e Привет test3) <(./s21_grep -l test test1 test2 -e Привет test3) -s -q
echo ключь -l 
diff <(grep -l Привет test test1 test2 test3) <(./s21_grep -l Привет test test1 test2 test3) -s -q
echo ключь -l -v
diff <(grep -l -v Привет test test1 test2 test3) <(./s21_grep -l -v Привет test test1 test2 test3) -s -q
echo ключь -l -i
diff <(grep -l -i KITCHEN test test1 test2 test3) <(./s21_grep -l -i KITCHEN test test1 test2 test3) -s -q
echo ключь -c 
diff <(grep -c Привет test test1 test2 test3) <(./s21_grep -c Привет test test1 test2 test3) -s -q
echo ключь -c -l
diff <(grep -c -l Привет test test1 test2 test3) <(./s21_grep -c -l Привет test test1 test2 test3) -s -q
echo ключь -c -i
diff <(grep -c -i KITCHEN test test1 test2 test3) <(./s21_grep -c -i KITCHEN test test1 test2 test3) -s -q
echo ключь -c -n
diff <(grep -c -n Привет test test1 test2 test3) <(./s21_grep -c -n Привет test test1 test2 test3) -s -q
echo ключь -c -v
diff <(grep -c -v Привет test test1 test2 test3) <(./s21_grep -c -v Привет test test1 test2 test3) -s -q
echo ключь -c -e
diff <(grep -c test test1 -e Привет test2 test3) <(./s21_grep -c test test1 -e Привет test2 test3) -s -q
echo ключь -c -v -n -e
diff <(grep -c -v -n test test1 -e Привет test2 test3) <(./s21_grep -c -v -n test test1 -e Привет test2 test3) -s -q
echo ключь -c -v -n -i -e
diff <(grep -c -v -n -i test test1 -e KITCHEN test2 test3) <(./s21_grep -c -v -n -i test test1 -e KITCHEN test2 test3) -s -q
echo флаг -h
diff <(grep -h kitchen test test1 test2 test3) <(./s21_grep -h kitchen test test1 test2 test3) -s -q
echo флаг -h -v
diff <(grep -h -v kitchen test test1 test2 test3) <(./s21_grep -h -v kitchen test test1 test2 test3) -s -q
echo флаг -h -c
diff <(grep -h -c kitchen test test1 test2 test3) <(./s21_grep -h -c kitchen test test1 test2 test3) -s -q
echo флаг -h -l
diff <(grep -h -l kitchen test test1 test2 test3) <(./s21_grep -h -l kitchen test test1 test2 test3) -s -q
echo флаг -h -n
diff <(grep -h -n kitchen test test1 test2 test3) <(./s21_grep -h -n kitchen test test1 test2 test3) -s -q
echo флаг -h -e
diff <(grep -h test test1 -e kitchen test2 test3) <(./s21_grep -h test test1 -e kitchen test2 test3) -s -q
echo флаг -h -i
diff <(grep -h -i KITCHEN test test1 test2 test3) <(./s21_grep -h -i KITCHEN test test1 test2 test3) -s -q
echo флаг -h -n -l
diff <(grep -h -n -l kitchen test test1 test2 test3) <(./s21_grep -h -n -l kitchen test test1 test2 test3) -s -q
echo флаг -h -n -v
diff <(grep -h -n -v kitchen test test1 test2 test3) <(./s21_grep -h -n -v kitchen test test1 test2 test3) -s -q
echo флаг -h -n -c
diff <(grep -h -n -c kitchen test test1 test2 test3) <(./s21_grep -h -n -c kitchen test test1 test2 test3) -s -q
echo флаг -h -n -l -c -v
diff <(grep -h -n -l -c -v kitchen test test1 test2 test3) <(./s21_grep -h -n -l -c -v kitchen test test1 test2 test3) -s -q
echo флаг -o
diff <(grep -o kitchen test test1 test2 test3) <(./s21_grep -o kitchen test test1 test2 test3) -s -q
echo флаг -o -v
diff <(grep -o -v kitchen test test1 test2 test3) <(./s21_grep -o -v kitchen test test1 test2 test3) -s -q
echo флаг -o -c
diff <(grep -o -c kitchen test test1 test2 test3) <(./s21_grep -o -c kitchen test test1 test2 test3) -s -q
echo флаг -o -l
diff <(grep -o -l kitchen test test1 test2 test3) <(./s21_grep -o -l kitchen test test1 test2 test3) -s -q
echo флаг -o -n
diff <(grep -o -n kitchen test test1 test2 test3) <(./s21_grep -o -n kitchen test test1 test2 test3) -s -q
echo флаг -o -e
diff <(grep  -o test test1 -e kitchen test2 test3) <(./s21_grep -o test test1 -e kitchen test2 test3) -s -q
echo флаг -o -i
diff <(grep -o  -i KITCHEN test test1 test2 test3) <(./s21_grep -o  -i KITCHEN test test1 test2 test3) -s -q
echo флаг -o -h -n -l
diff <(grep -o -h -n -l kitchen test test1 test2 test3) <(./s21_grep -o -h -n -l kitchen test test1 test2 test3) -s -q
echo флаг -o -h -n -v
diff <(grep -o -h -n -v kitchen test test1 test2 test3) <(./s21_grep -o -h -n -v kitchen test test1 test2 test3) -s -q
echo флаг -o -h -n -c
diff <(grep -o -h -n -c kitchen test test1 test2 test3) <(./s21_grep -o -h -n -c kitchen test test1 test2 test3) -s -q
echo флаг -o -h -n -l -c -v
diff <(grep -o -h -n -l -c -v kitchen test test1 test2 test3) <(./s21_grep -o -h -n -l -c -v kitchen test test1 test2 test3) -s -q
echo флаг -f
diff <(grep -f test_string test test1 test2 test3) <(./s21_grep -f test_string test test1 test2 test3) -s -q
# echo флаг -o -f
# diff <(grep -o -f test_string test test1 test2 test3) <(./s21_grep -o -f test_string test test1 test2 test3) -s -q
echo флаг -c -f
diff <(grep -c -f test_string test test1 test2 test3) <(./s21_grep -c -f test_string test test1 test2 test3) -s -q
echo флаг -o -l -f
diff <(grep -o -l -f test_string test test1 test2 test3) <(./s21_grep -o -l -f test_string test test1 test2 test3) -s -q
echo флаг -n -f
diff <(grep -n -f test_string test test1 test2 test3) <(./s21_grep -n -f test_string test test1 test2 test3) -s -q
echo флаг -f -i
diff <(grep -i -f str_test test test1 test2 test3) <(./s21_grep -i -f str_test test test1 test2 test3) -s -q
echo флаг -o -h -n -l -f
diff <(grep -o -h -n -l -f test_string test test1 test2 test3) <(./s21_grep -o -h -n -l -f test_string test test1 test2 test3) -s -q
echo флаг -h -n -v -f
diff <(grep -h -n -v -f test_string test test1 test2 test3) <(./s21_grep -h -n -v -f test_string test test1 test2 test3) -s -q
echo флаг -o -h -n -c -f
diff <(grep -o -h -n -c -f test_string test test1 test2 test3) <(./s21_grep -o -h -n -c -f test_string test test1 test2 test3) -s -q
echo флаг -h -n -l -c -v -f
diff <(grep -h -n -l -c -v -f test_string test test1 test2 test3) <(./s21_grep -h -n -l -c -v -f test_string test test1 test2 test3) -s -q




echo
echo

echo █████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
echo █░░░░░░██████████░░░░░░█░░░░░░░░░░░░░░█░░░░░░██████████░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░███░░░░░░░░██░░░░░░░░████░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█
echo █░░▄▀░░░░░░░░░░░░░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░░░░░░░░░░░░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███░░▄▀▄▀░░██░░▄▀▄▀░░████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█
echo █░░▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░░░░░░░▄▀░░███░░░░▄▀░░██░░▄▀░░░░████░░░░░░▄▀░░░░░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░░░█░░░░░░▄▀░░░░░░█
echo █░░▄▀░░░░░░▄▀░░░░░░▄▀░░█░░▄▀░░█████████░░▄▀░░░░░░▄▀░░░░░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░████░░▄▀░░█████░░▄▀▄▀░░▄▀▄▀░░██████████░░▄▀░░█████░░▄▀░░█████████░░▄▀░░█████████████░░▄▀░░█████
echo █░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░░░▄▀░░█████░░░░▄▀▄▀▄▀░░░░██████████░░▄▀░░█████░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░░░█████░░▄▀░░█████
echo █░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███████░░░░▄▀░░░░████████████░░▄▀░░█████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█████░░▄▀░░█████
echo █░░▄▀░░██░░░░░░██░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░██░░░░░░██░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░▄▀░░░░█████████░░▄▀░░██████████████░░▄▀░░█████░░▄▀░░░░░░░░░░█░░░░░░░░░░▄▀░░█████░░▄▀░░█████
echo █░░▄▀░░██████████░░▄▀░░█░░▄▀░░█████████░░▄▀░░██████████░░▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░███████████░░▄▀░░██████████████░░▄▀░░█████░░▄▀░░█████████████████░░▄▀░░█████░░▄▀░░█████
echo █░░▄▀░░██████████░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░██████████░░▄▀░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░██░░▄▀░░░░░░███████░░▄▀░░██████████████░░▄▀░░█████░░▄▀░░░░░░░░░░█░░░░░░░░░░▄▀░░█████░░▄▀░░█████
echo █░░▄▀░░██████████░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██████████░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀▄▀▄▀░░███████░░▄▀░░██████████████░░▄▀░░█████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█████░░▄▀░░█████
echo █░░░░░░██████████░░░░░░█░░░░░░░░░░░░░░█░░░░░░██████████░░░░░░█░░░░░░░░░░░░░░█░░░░░░██░░░░░░░░░░███████░░░░░░██████████████░░░░░░█████░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█████░░░░░░█████
echo ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████





echo
echo "**************"
echo TEST №3"      *"
echo "**************"
echo Проверка на утечки valgrnid 
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep Привет test 
echo
echo ===============================================1====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -n test test1 -e Привет test2 test3
echo
echo ===============================================2====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -o kitchen test
echo
echo ===============================================3====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -f test_string test
echo
echo ===============================================4====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -f test_string test test2 test3 test4
echo
echo ===============================================5====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -f test_string test test2 test3 tes4
echo
echo ===============================================6====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -f test_sting test test2 test3 tes4
echo ===============================================7====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep test test2 test3 test4 -e kit
echo
echo ===============================================8====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -e -o kit test test2 test3 test4
echo
echo ===============================================9====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -i kit test test2 test3 test4
echo
echo ===============================================10====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -v kit test test2 test3 test4
echo
echo ===============================================11====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -n kit test test2 test3 test4
echo
echo ===============================================12====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -l kit test test2 test3 test4
echo
echo ===============================================13====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -h kit test test2 test3 test4
echo
echo ===============================================14====================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -c kit test test2 test3 test4
echo