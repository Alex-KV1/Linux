#!/bin/bash
echo
echo "**************"
echo TEST №1"      *"
echo "**************"
echo
echo Ожидаемый вывод identical
diff <(cat tests/test) <(./s21_cat tests/test) -s -q
echo "-------------------------------------------"
echo Ожидаемый вывод differ
diff <(cat tests/test) <(./s21_cat tests/test1) -s -q

echo
echo Ожидаемый вывод identical тесты с комбинацяими ключей
echo Импользуемый"(ые)" флаг"(и)" "-n "
diff <(cat tests/test -n) <(./s21_cat tests/test -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b"
diff <(cat tests/test -b) <(./s21_cat tests/test -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b -n"
diff <(cat tests/test -b -n ) <(./s21_cat tests/test -n -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b -n -v"
diff <(cat tests/test -n -b -v) <(./s21_cat tests/test -n -b -v) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-v"
diff <(cat tests/test -v) <(./s21_cat tests/test -v) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s"
diff <(cat tests/test -s) <(./s21_cat tests/test -s) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-t"
diff <(cat tests/test -t) <(./s21_cat tests/test -t) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s -n"
diff <(cat tests/test -s -n) <(./s21_cat tests/test -s -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s -b"
diff <(cat tests/test -s -b) <(./s21_cat tests/test -s -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-t -b"
diff <(cat tests/test3 -t -b) <(./s21_cat tests/test3 -t -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T"
diff <(cat tests/test3 -T) <(./s21_cat tests/test3 -T) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T -n"
diff <(cat tests/test3 -T -n) <(./s21_cat tests/test3 -T -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-E"
diff <(cat tests/test3 -E) <(./s21_cat tests/test3 -E) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--squeeze-blank "
diff <(cat tests/test3 --squeeze-blank ) <(./s21_cat tests/test3 --squeeze-blank ) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--show-tabs "
diff <(cat tests/test3 --show-tabs ) <(./s21_cat tests/test3 --show-tabs ) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--show-nonprinting "
diff <(cat tests/test3 --show-nonprinting ) <(./s21_cat tests/test3 --show-nonprinting ) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--show-ends"
diff <(cat tests/test3 --show-ends) <(./s21_cat tests/test3 --show-ends) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--number-nonblank"
diff <(cat tests/test3 --number-nonblank) <(./s21_cat tests/test3 --number-nonblank) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--number-nonblank -v"
diff <(cat -v tests/test3 --number-nonblank) <(./s21_cat -v tests/test3 --number-nonblank) -s -q



echo
echo Ожидаемый вывод differ тесты с комбинацяими ключей
echo Импользуемый"(ые)" флаг"(и)" "-n "
diff <(cat tests/test -n) <(./s21_cat tests/test -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b"
diff <(cat tests/test -b) <(./s21_cat tests/test -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b -n"
diff <(cat tests/test -b -n ) <(./s21_cat tests/test -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b -n -v"
diff <(cat tests/test -n -b -v) <(./s21_cat tests/test -n -v) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-v"
diff <(cat tests/test -v) <(./s21_cat tests/test -E) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s"
diff <(cat tests/test -s) <(./s21_cat tests/test -t) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-t"
diff <(cat tests/test -s) <(./s21_cat tests/test -t) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s -n"
diff <(cat tests/test -s -n) <(./s21_cat tests/test -s) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s -b"
diff <(cat tests/test -s -b) <(./s21_cat tests/test -s -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-t -b"
diff <(cat tests/test3 -t -b) <(./s21_cat tests/test3 -t -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T"
diff <(cat tests/test3 -T) <(./s21_cat tests/test3 -E) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T -n"
diff <(cat tests/test3 -T -n) <(./s21_cat tests/test3 -T) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-E"
diff <(cat tests/test3 -E) <(./s21_cat tests/test3 -T) -s -q

echo "**************"
echo TEST №2"      *"
echo "**************"
echo Несколько файлов
echo
echo Ожидаемый вывод identical тесты с комбинацяими ключей
echo Импользуемый"(ые)" флаг"(и)" "-n "
diff <(cat tests/test tests/test2 -n) <(./s21_cat tests/test tests/test2 -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -b) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b -n"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -b -n ) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -n -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-b -n -v"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -n -b -v) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -n -b -v) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-v"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -v) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -v) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -s) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -s) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-t"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -t) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -t) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s -n"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -s -n) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -s -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-s -b"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -s -b) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -s -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-t -b"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -t -b) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -t -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T -n"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -n) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-E"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T -E"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -E) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -E) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T -v -s -n"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -v -s -n) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -v -s -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-T -v -s -b"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -v -s -b) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -T -v -s -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-E -v -s -b"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E -v -s -b) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E -v -s -b) -s -q
echo Импользуемый"(ые)" флаг"(и)" "-E -v -s -n"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E -v -s -n) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E -v -s -n) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--squeeze-blank"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --squeeze-blank) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --squeeze-blank) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--show-tabs"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --show-tabs) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --show-tabs) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--show-nonprinting"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --show-nonprinting) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --show-nonprinting) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--show-ends"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --show-ends) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --show-ends) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--number-nonblank"
diff <(cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --number-nonblank) <(./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 --number-nonblank) -s -q
echo Импользуемый"(ые)" флаг"(и)" "--number-nonblank -v"
diff <(cat -v tests/test tests/test1 tests/test2 tests/test3 tests/test4 --number-nonblank) <(./s21_cat -v tests/test tests/test1 tests/test2 tests/test3 tests/test4 --number-nonblank) -s -q




echo
echo "**************"
echo TEST №3"      *"
echo "**************"
echo Проверка на утечки valgrnid 
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_cat tests/test -n
echo
echo ===================================================================================================
echo
valgrind --tool=memcheck --leak-check=yes  ./s21_cat tests/test tests/test1 tests/test2 tests/test3 tests/test4 -E -v -s -n
#valgrind --tool=memcheck --leak-check=yes  ./s21_cat tests/test -s
#valgrind --tool=memcheck --leak-check=yes  ./s21_cat tests/test -b
#valgrind --tool=memcheck --leak-check=yes  ./s21_cat tests/test -v
#valgrind --tool=memcheck --leak-check=yes  ./s21_cat tests/test -t
