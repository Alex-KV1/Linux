#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define BUFER_SIZE 1024

typedef struct letter {
  int e;  // поиск по шаблону;
  int i;  // Игнорировать различия регистра
  int v;  // Инвертировать смысл поиска соответствий
  int c;  // Выводить только количество совпадающих строк
  int l;  // Выводит только совпадающие файлы.
  int n;  // Предваряет каждую строку вывода номером строки из файла ввода.
  int h;  // Выводит совпадающие строки, не предваряя их именами файлов.
  int s;  // Подавляет сообщения об ошибках о несуществующих или нечитаемых
          // файлах.
  int o;  // Печатает только совпадающие (непустые) части совпавшей строки.
  int f;  // получение шаблона из файла.
  int count_file;  // счетчик файлов
  int math;        // счетчик совпадений
  int count_str;
} option_letter;

void grep(int args, char **argv);
void print_file(FILE *file, option_letter *option, char **pattern, char *name,
                char *pat_file);
void get_option(int argc, char **argv, option_letter *option, char ***pattern,
                char ***nameFiles, char **pat_file);
void new_str(char *str, int start, int end);
char *get_pattern_from_file(char *rstr, char *pat_file);

// char **gen_mas(int argc, char **argv, letter *option);
// void free_mas(char **mas, letter *option);