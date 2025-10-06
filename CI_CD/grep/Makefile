cc = gcc -Werror -Wextra -Wall

all: s21_grep

s21_grep: s_21grep.c grep_functions.c 
	${cc} -std=c11 s_21grep.c grep_functions.c -o s21_grep
s: s_21grep.c grep_functions.c
	gcc s_21grep.c grep_functions.c -o s21_grep
check: s_21grep.c grep_functions.c
	clang-format -n *.c *.h
repair: s_21grep.c grep_functions.c
	clang-format -i *.c *.h
clean:
	rm -rf s21_grep
	
