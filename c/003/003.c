#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

typedef struct {
  unsigned long long *values;
  unsigned long long capacity;
  unsigned long long length;
} NumberList;

void initializeList(NumberList *list);

void deinitializeList(NumberList *list);

void push(NumberList *list, unsigned long long value);

void primeFactors(unsigned long long n, NumberList *result);

int main(int argc, char *argv[]) {
  NumberList list;

  initializeList(&list);

  primeFactors(600851475143, &list);

  printf("%llu\n", list.values[list.length - 1]);

  deinitializeList(&list);

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

void primeFactors(unsigned long long n, NumberList *result) {
  bool found = false;

  unsigned long long v = 2;

  for (unsigned long long i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      found = true;

      v = i;

      break;
    }
  }

  if (found) {
    push(result, v);

    primeFactors(n / v, result);
  } else {
    push(result, n);
  }
}
