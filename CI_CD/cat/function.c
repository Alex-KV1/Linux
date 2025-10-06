#include "function.h"

void cat(int argc, char **argv) {
  if (argc > 1) {
    letter option = {0};
    char **ptr_name_file = gen_mas(argc, argv, &option);
    get_option(argc, argv, &option, ptr_name_file);
    option.count_str = 1;
    for (int i = 0; i < option.count_file; i++) {
      FILE *file = fopen(ptr_name_file[i], "r");
      if (file == NULL) {
        // printf("Ошибка возвращено значение NULL Файл не наеден.");
        //  fclose(file);
      } else {
        print_file(file, &option);
        fclose(file);
      }
    }
    free_mas(ptr_name_file, &option);
  } else
    printf("Не введено имя файла\n");
}

void print_file(FILE *file, letter *option) {
  int flag = 0;
  int count_sp = 0;
  char *str = malloc(3 * sizeof(char));
  for (int i = 0; i < 3; str[i] = 0, i++)
    ;
  //Инициализация буферной строки
  // printf("Инициализация буферной строки: %s\n", str);
  // char symb, last;
  option->new_line = 1;
  // option->count_str = 1;
  if (option->n == 1 && option->b == 1) {
    option->n = 0;
  }  //если переданы два флага одновременно n и b
  for (int i = 1; i == 1;) {
    str[i] = fgetc(file);
    if (str[i] == -1) break;

    if (option->n == 1 &&
        option->new_line == 1) {  // работает при флаге n нумерует строки
      option->new_line = 0;
      if (option->s == 0)
        printf("%6d\t", option->count_str);
      else if (option->s != 0 && count_sp > 1) {
        option->count_str -= 1;
      } else if (option->s == 1 && count_sp <= 1) {
        if (option->e == 1 && str[1] == '\n')
          printf("%6d\t$", option->count_str);
        else
          printf("%6d\t", option->count_str);
        while (str[1] == '\n') {
          str[1] = fgetc(file);
          if (str[1] == -1) {
            flag = 1;
            printf("\n");
            break;
          }
          if (str[i] != '\n') {
            option->count_str += 1;
            printf("\n%6d\t", option->count_str);
          }
          str[0] = str[1];
        }
        count_sp = 0;
      }
    }
    if (flag == 1) break;

    if (str[0] == '\n' && str[1] == '\n') {
      option->is_empty = 1;
      option->new_line = 1;
      option->count_b += 1;
      count_sp += 1;
      if (option->b == 0) option->count_str += 1;
    } else if (str[0] == '\n' && str[1] != '\n') {
      option->is_empty = 0;
      count_sp = 0;
      if (option->b == 1) option->new_line = 1;
    }

    if (option->e == 1 && str[1] == '\n') {  // реализация флага e
      if (option->s == 0) {
        printf("$");
      } else if (option->s != 0 && count_sp > 1)
        ;
      else if (option->s == 1 && count_sp <= 1)
        printf("$");
    }

    if (option->b == 1 && option->new_line == 1 &&
        option->is_empty == 0) {  // нумерация только не пустых строк
      option->new_line = 0;
      printf("%6d\t", option->count_str);
    } else if (option->b == 1 && &option->is_empty != 0) {
      option->new_line = 0;
      option->count_b = 0;
      option->is_empty = 0;
    }

    if (str[0] != '\n' && str[1] == '\n') {
      option->new_line = 1;
      option->count_str += 1;
    }

    if (option->s == 1 && count_sp > 1) {  //пропуск двойных строк s
      str[0] = str[1];
      continue;
    }

    if (option->t == 1 && str[1] == '\t') {  // реализация флага t;
      str[0] = str[i];
      printf("^I");
      continue;
    }

    if (option->v == 1) {  // флаг -v
      if (str[1] < -96) {
        printf("M-^%c", str[1] + 192);
      } else if (str[1] < 0) {
        printf("M-%c", str[1] + 128);
      } else if (str[1] == 9 || str[i] == 10) {
        printf("%c", str[i]);
      } else if (str[1] < 32) {
        printf("^%c", str[1] + 64);
      } else if (str[1] < 127) {
        printf("%c", str[1]);
      } else {
        printf("^&");
      }
      str[0] = str[1];
      continue;
    }

    printf("%c", str[1]);
    str[0] = str[1];
  }

  //отладочный printf
  // printf("b = %d\ne = %d\ns = %d\nn = %d\nt = %d\nv = %d\nn_line =
  // %d\ncount_b = %d\ncount_str = %d\nis_empty = %d\ncount_file = %d\n",
  // option->b, option->e, option->s, option->n, option->t, option->v,
  // option->new_line, option->count_b, option->count_str, option->is_empty,
  // option->count_file);
  free(str);
}

void get_option(int argc, char **argv, letter *option, char **name_file) {
  int index = 0;
  if (argc > 1) {
    for (int i = 1; i < argc; i++) {
      if (argv[i][0] == '-') {
        size_t j = 1;
        while (j < strlen(argv[i])) {
          int correct_flag = 0;
          if (strlen(argv[i]) > 1) {
            if (argv[i][0] && argv[i][1] == '-') j = strlen(argv[i]);
          }

          if ((argv[i][j] == 'b') ||
              (strcmp(argv[i], "--number-nonblank") == 0)) {
            option->b = 1;
            correct_flag = 1;
          }
          if (argv[i][j] == 'e') {
            option->e = 1;
            option->v = 1;
            correct_flag = 1;
          }
          if ((argv[i][j] == 'E') || (strcmp(argv[i], "--show-ends") == 0)) {
            option->e = 1;
            option->v = 0;
            correct_flag = 1;
          }
          if ((argv[i][j] == 'n') || (strcmp(argv[i], "--number") == 0)) {
            option->n = 1;
            correct_flag = 1;
          }
          if ((argv[i][j] == 's') ||
              (strcmp(argv[i], "--squeeze-blank") == 0)) {
            option->s = 1;
            correct_flag = 1;
          }
          if (argv[i][j] == 't') {
            option->t = 1;
            option->v = 1;
            correct_flag = 1;
          }
          if ((argv[i][j] == 'T') || (strcmp(argv[i], "--show-tabs") == 0)) {
            option->t = 1;
            option->v = 0;
            correct_flag = 1;
          }
          if ((argv[i][j] == 'v') ||
              (strcmp(argv[i], "--show-nonprinting") == 0)) {
            option->v = 1;
            correct_flag = 1;
          }
          if (correct_flag == 0) {
            printf(
                "%s ОШИБКА: Введена не корректная опция: -%c\nКорректные "
                "опции: -b -e -E -n -s -T -v\nа также: --squeeze-blank "
                "--show-tabs --show-nonprinting --show-ends "
                "--number-nonblank\n",
                argv[0], argv[i][j]);
            free_mas(name_file, option);
            exit(1);
          }
          j++;
        }
      } else {
        if (i < argc) {
          strcpy(name_file[index], argv[i]);
          index++;
        }
      }
    }

  } else
    printf("\nВведено тоелько имя файла без параметров\n");
}

char **gen_mas(int argc, char **argv, letter *option) {
  int count = 0;
  char **mas;
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] != '-') count++;
  }
  mas = (char **)malloc(count * sizeof(char *));
  for (int i = 0; i < count; i++) {
    mas[i] = (char *)malloc(20 * sizeof(char));
  }
  option->count_file = count;

  return mas;
}

void free_mas(char **mas, letter *option) {
  int len = option->count_file;
  for (int i = 0; i < len; i++) {
    free(mas[i]);
  }
  free(mas);
}