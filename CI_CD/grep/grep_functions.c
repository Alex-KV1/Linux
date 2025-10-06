#include "grep_functions.h"
#define parameters "e:ivclnhsof:"
#define ARRAY_SIZE(arr) (sizeof((arr)) / sizeof((arr)[0]))

void grep(int argc, char **argv) {
  if (argc > 1) {
    char **pattern = NULL;  // укзатель на будующий указатель на шаблон
    char **nameFiles =
        NULL;  // уазактель на будующий указателей на имена файлов
    char *pat_file =
        NULL;  // укзатель на будующий указатель на шаблон из файла;
    option_letter option = {0};
    get_option(argc, argv, &option, &pattern, &nameFiles, &pat_file);
    for (int i = 0; nameFiles[i] != NULL; i++) {
      FILE *file = fopen(nameFiles[i], "r");
      if (file == NULL) {
        if (option.s != 1)
          printf("Ошибка Файл с именем -: \"%s\" не наеден.\n", nameFiles[i]);
        //  fclose(file);
      } else {
        print_file(file, &option, pattern, nameFiles[i], pat_file);
        fclose(file);
      }
    }
    if (pat_file != NULL) free(pat_file);
  } else {
    printf(
        "Приминение: ./s21_grep [опции -e, -i, -v, -c, -l, -n -f]... шаблон "
        "поиска [имя(ена) файла(ов)]\n");
  }
}

void print_file(FILE *file, option_letter *option, char **pattern, char *name,
                char *pat_file) {
  option->count_str = 0;
  option->math = 0;
  regex_t reegex;
  char *str = malloc(1024 * sizeof(char));

  if (option->f == 0) {
    if (regcomp(&reegex, pattern[0], option->i ? REG_ICASE : REG_EXTENDED) ==
        0) {  // создание регулярного выражения + установка флага REG_ICASE -
              // игнор регистра ->-> расшир регуляр выражения
    } else
      (printf("regcomp  ошибка создания шаблона\n"));
  } else if (option->f == 1) {
    if (regcomp(&reegex, pat_file, option->i ? REG_ICASE : REG_EXTENDED) == 0) {
    } else
      (printf("regcomp  ошибка создания шаблона\n"));
  }
  int print_flag = 0;  // флаг для печати с флагом l

  while (fgets(str, 1023, file) != NULL) {
    option->count_str += 1;
    if ((regexec(&reegex, str, 0, NULL, 0) == 0)) {
      if (option->o == 1) {  // опция -o
        regmatch_t pmatch[1];
        if (regexec(&reegex, str, ARRAY_SIZE(pmatch), pmatch, 0) ==
            0) {  // флаг -о
          new_str(str, pmatch[0].rm_so, pmatch[0].rm_eo);
        }
      }
      if (option->f == 1) {
      }
      option->math += 1;
      if (option->c == 0 || option->l == 0) {
        if (option->count_file > 1 && option->v != 1) {
          if (option->l == 1) {
            if ((option->n == 1 || option->i == 1 || option->e == 1 ||
                 option->l == 1) &&
                print_flag == 0) {
              printf("%s\n", name);
              print_flag = 1;
            }
          } else if (option->c == 0 && option->h != 1) {
            printf("%s:", name);
          }
        }
        if (option->n && option->v != 1 && option->l != 1 && option->c != 1)
          printf("%d:", option->count_str);
        if (option->v != 1 && option->l != 1 && option->c != 1)
          printf("%s", str);
        if (option->l == 1 && option->count_file <= 1 && option->v != 1 &&
            print_flag != 1) {
          print_flag = 1;
          printf("%s\n", name);
        }
      }
    } else if (option->v == 1) {
      if (option->count_file > 1) {
        if (option->v == 1 && option->l == 1 && print_flag == 0) {
          printf("%s\n", name);
          print_flag = 1;
        } else if (option->l != 1 && option->c != 1 && option->h != 1 &&
                   option->o != 1) {
          printf("%s:", name);
        }
      }
      if (option->n && option->l != 1 && option->c != 1 && option->o != 1)
        printf("%d:", option->count_str);
      if (option->l != 1 && option->c != 1 && option->o != 1) printf("%s", str);
      if (option->count_file <= 1 && option->l == 1 && print_flag == 0) {
        printf("%s\n", name);
        print_flag = 1;
      }
    }
  }
  if (option->c == 1) {  // флаг c
    if (option->count_file > 1) {
      if (option->v == 0) {
        if (option->l == 1 && option->math > 0) {
          printf("%s\n", name);
        } else if (option->l == 0) {
          if (option->h == 1) {
            printf("%d\n", option->math);
          } else
            printf("%s:%d\n", name, option->math);
        }
      } else if (option->h != 1 && option->l != 1)
        printf("%s:%d\n", name, option->count_str - option->math);

    } else {
      if (option->v == 0) {
        if (option->l == 1 && option->math > 0) {
          printf("%s\n", name);
        } else if (option->l == 0) {
          printf("%d\n", option->math);
        }
      } else if (option->l != 1)
        printf("%d\n", option->count_str - option->math);
    }
  }
  regfree(&reegex);
  free(str);
}

void get_option(int argc, char **argv, option_letter *option, char ***pattern,
                char ***nameFiles, char **pat_file) {
  char ch = 0;
  opterr = 0;
  // *pattern += 1;
  while ((ch = getopt(argc, argv, parameters)) != -1) {
    if (ch == 'e') {
      option->e = 1;
    } else if (ch == 'i') {
      option->i = 1;
    } else if (ch == 'v') {
      option->v = 1;
    } else if (ch == 'c') {
      option->c = 1;
    } else if (ch == 'l') {
      option->l = 1;
    } else if (ch == 'n') {
      option->n = 1;
    } else if (ch == 'h') {
      option->h = 1;
    } else if (ch == 's') {
      option->s = 1;
    } else if (ch == 'o') {
      option->o = 1;
    } else if (ch == 'f') {
      option->f = 1;
    }
  }
  if (option->e && option->f == 1) option->f = 0;
  if (option->e != 1 && option->f != 1) {
    *pattern = &argv[optind];
    *nameFiles = &argv[optind + 1];
  } else if (option->e == 1 && option->f != 1) {
    *nameFiles = &argv[optind];
    for (int i = 0; i < argc;
         i++) {  //ищем индекс шаблона если активирован флаг e;
      if (strcmp(argv[i], "-e") == 0) {
        *pattern = &argv[i + 1];
        break;
      }
    }
  } else if (option->e != 1 && option->f == 1) {
    *nameFiles = &argv[optind];
    for (int i = 0; i < argc;
         i++) {  //ищем индекс шаблона если активирован флаг f;
      if (strcmp(argv[i], "-f") == 0) {
        *pat_file = get_pattern_from_file(argv[i + 1], *pat_file);
        break;
      }
    }
  }
  if (option->f == 1) {
    int jj = 0;
    while (argv[jj][1] != 'f') jj++;
    jj += 2;
    if (jj < argc) {
      for (; jj < argc; jj++) {
        if (argv[jj][0] != '-') {
          option->count_file += 1;
        }
      }
    }
  } else {
    for (int i = 1; i < argc; i++) {  //считаем сколько фалов на входе
      if (argv[i][0] != '-') {
        option->count_file += 1;
      }
    }
    option->count_file -= 1;
  }
}

void new_str(char *str, int start, int end) {
  int len = (end - start);
  char *new_str = malloc(len + 1 * sizeof(char));
  // char new_str[BUFER_SIZE];
  for (int i = 0; i < len; i++, start++) {
    new_str[i] = str[start];
  }
  new_str[len] = '\n';
  for (int i = 0; i < len; i++) {
    str[i] = new_str[i];
  }
  str[len] = '\n';
  str[len + 1] = '\0';
  free(new_str);
}

char *get_pattern_from_file(char *rstr, char *pat_file) {
  FILE *ptrfile = fopen(rstr, "r");
  if (ptrfile == NULL) {
    printf("Ошибка Файл с шаблоном с именем -: \"%s\" не наеден.\n", rstr);
    if (pat_file != NULL) free(pat_file);
    exit(1);
  } else {
    char c;
    int ch = '\n';
    int i = 0;
    pat_file = malloc(256 * sizeof(char));
    while ((c = fgetc(ptrfile)) != EOF) {
      if (ch == '\n' || c == '\n') {
        if (ch == '\n' && c == '\n')
          continue;
        else if (ch == '\n' && c != '\n' && c != '\0') {
          pat_file[i] = c;
        } else if (ch != '\n' && ch != '\0' && c == '\n') {
          pat_file[i] = '|';
        }
      } else {
        pat_file[i] = c;
      }
      i++;
      ch = c;
    }
    pat_file[i - 1] = '\0';
    fclose(ptrfile);
  }
  return pat_file;
}
