#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct {
  unsigned long long *values;
  unsigned long long capacity;
  unsigned long long length;
} NumberList;

void initializeList(NumberList *list);

void deinitializeList(NumberList *list);

void push(NumberList *list, unsigned long long value);

void strrev(char *s);

int comp(const void *a, const void *b);

int main(int argc, char *argv[]) {
  NumberList palindromes;

  initializeList(&palindromes);

  for (unsigned long long i = 100; i < 1000; i++) {
    for (unsigned long long j = 100; j < 1000; j++) {
      unsigned long long product = i * j;

      char s[7];

      sprintf(s, "%llu", i * j);

      char r[7];

      strcpy(r, s);

      strrev(r);

      if (strcmp(s, r) == 0) {
        push(&palindromes, product);
      }
    }
  }

  qsort(palindromes.values, palindromes.length, sizeof(unsigned long long), comp);

  printf("%llu\n", palindromes.values[palindromes.length - 1]);

  deinitializeList(&palindromes);

  return 0;
}

void strrev(char *s) {
  char *r = s;

  while(r && *r) {
    ++r;
  }

  for (--r; s < r; ++s, --r) {
    *s = *s ^ *r;

    *r = *s ^ *r;

    *s = *s ^ *r;
  }
}

int comp (const void *a, const void *b) {
    unsigned long long f = *((unsigned long long*)a);
    unsigned long long s = *((unsigned long long*)b);

    if (f > s) {
      return  1;
    }

    if (f < s) {
      return -1;
    }

    return 0;
}

void initializeList(NumberList *list) {
  list->values = calloc(1024, sizeof(unsigned long long));

  list->capacity = 1024;

  list->length = 0;
}

void deinitializeList(NumberList *list) {
  free(list->values);

  list->values = 0;

  list->capacity = 0;

  list->length = 0;
}

void push(NumberList *list, unsigned long long value) {
  if (list && list->values) {
    if (list->length + 1 > list->capacity) {

      list->capacity *= 2;

      list->values = realloc(list->values, sizeof(unsigned long long) * list->capacity);
    }

    list->values[list->length] = value;

    list->length += 1;
  }
}
