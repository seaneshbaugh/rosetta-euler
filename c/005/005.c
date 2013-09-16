#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef struct {
  unsigned long long *values;
  unsigned long long capacity;
  unsigned long long length;
} NumberList;

int comp(const void *a, const void *b);

void initializeList(NumberList *list);

void deinitializeList(NumberList *list);

void push(NumberList *list, unsigned long long value);

void overlap(NumberList *a, NumberList *b);

void primeFactors(unsigned long long n, NumberList *result);

int main(int argc, char *argv[]) {
  NumberList primeFactorLists[20];

  NumberList factors;

  initializeList(&factors);

  for (unsigned long long i = 1; i <= 20; i++) {
    initializeList(&primeFactorLists[i - 1]);

    primeFactors(i, &primeFactorLists[i - 1]);

    overlap(&factors, &primeFactorLists[i - 1]);

    deinitializeList(&primeFactorLists[i - 1]);
  }

  unsigned long long product = 1;

  for (unsigned long long i = 0; i < factors.length; i++) {
    product *= factors.values[i];
  }

  printf("%llu\n", product);

  deinitializeList(&factors);

  return 0;
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

int find(NumberList *list, unsigned long long value) {
  if (list && list->values) {
    if (list->length > 0) {
      for (unsigned long long i = 0; i < list->length; i++) {
        if (list->values[i] == value) {
          return i;
        }
      }
    }
  }

  return -1;
}

void removeAt(NumberList *list, int index) {
  if (list && list->values) {
    for (int i = index; i < list->length - 1; i++) {
      list->values[i] = list->values[i + 1];
    }

    list->length--;
  }
}

void concat(NumberList *a, NumberList *b) {
  if (a && a->values && b && b->values) {
    for (unsigned long long i = 0; i < b->length; i++) {
      push(a, b->values[i]);
    }
  }
}

void overlap(NumberList *a, NumberList *b) {
  for (unsigned long long i = 0; i < b->length; i++) {
    int index = find(a, b->values[i]);

    if (index != -1) {
      removeAt(a, index);
    }
  }

  concat(a, b);

  qsort(a->values, a->length, sizeof(unsigned long long), comp);
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
