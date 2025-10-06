#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct letter {
  int b;
  int e;
  int s;
  int n;
  int t;
  int v;
  int new_line;    // новая строка
  int count_b;     // счетчик пустых строк
  int count_str;   // задумывался для счетчика строк.
  int is_empty;    // есть ли путсые строки?
  int count_file;  // для счетчика файлов, использую для чтения нескольких
                   // входящих файлов.
} letter;

void cat(int args, char **argv);
void print_file(FILE *file, letter *option);
void get_option(int argc, char **argv, letter *option, char **name_file);
char **gen_mas(int argc, char **argv, letter *option);
void free_mas(char **mas, letter *option);