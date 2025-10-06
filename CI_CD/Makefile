cc = gcc -Werror -Wextra -Wall
grep_p =grep/
cat_p =cat/

grep_out =output/
cat_out =output/

all: s21_cat s21_grep

s21_cat: $(cat_p)s_21cat.c $(cat_p)function.c
	${cc} $(cat_p)s_21cat.c $(cat_p)function.c -o $(cat_out)s21_cat

s21_grep: $(grep_p)s_21grep.c $(grep_p)grep_functions.c 
	${cc} -std=c11 $(grep_p)s_21grep.c $(grep_p)grep_functions.c -o $(grep_out)s21_grep

check: $(cat_p)*.c $(cat_p)*.h $(grep_p)*.c $(grep_p)*.h
	clang-format -n $(grep_p)*.c $(grep_p)*.h
	clang-format -n $(cat_p)*.c $(cat_p)*.h
repair: $(cat_p)*.c $(cat_p)*.h $(grep_p)*.c $(grep_p)*.h
	clang-format -i $(grep_p)*.c $(grep_p)*.h
	clang-format -i $(cat_p)*.c $(cat_p)*.h
clean:
	rm -rf $(grep_out)s21_grep
	rm -rf $(cat_out)s21_cat
test: s21_cat s21_grep
	${cc} $(cat_p)s_21cat.c $(cat_p)function.c -o $(cat_p)s21_cat
	${cc} -std=c11 $(grep_p)s_21grep.c $(grep_p)grep_functions.c -o $(grep_p)s21_grep
	cd $(cat_p) && ./test_cat.sh
	cd $(grep_p) && ./test_grep.sh
clear_test:
	rm -rf $(grep_p)s21_grep
	rm -rf $(cat_p)s21_cat

	
