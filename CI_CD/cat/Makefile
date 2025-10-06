cc = gcc -Werror -Wextra -Wall

all: s21_cat

s21_cat: s_21cat.c function.c
	${cc} s_21cat.c function.c -o s21_cat

check: s_21cat.c function.c
	clang-format -n *.c *.h
repair: s_21cat.c function.c
	clang-format -i *.c *.h
clean:
	rm -rf s21_cat
