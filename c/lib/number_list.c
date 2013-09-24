#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "number_list.h"

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

int listAscendingCompare(const void *a, const void *b) {
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

int listDescendingCompare(const void *a, const void *b) {
    unsigned long long f = *((unsigned long long*)a);
    unsigned long long s = *((unsigned long long*)b);

    if (f < s) {
      return  1;
    }

    if (f > s) {
      return -1;
    }

    return 0;
}

void sortAscending(NumberList *list) {
  qsort(list->values, list->length, sizeof(unsigned long long), listAscendingCompare);
}

void sortDescending(NumberList *list) {
  qsort(list->values, list->length, sizeof(unsigned long long), listDescendingCompare);
}

void overlap(NumberList *a, NumberList *b) {
  for (unsigned long long i = 0; i < b->length; i++) {
    int index = find(a, b->values[i]);

    if (index != -1) {
      removeAt(a, index);
    }
  }

  concat(a, b);

  sortAscending(a);
}

char* toString(NumberList *list) {
  int i;

  char digitBuffer[21];

  unsigned long long digitLength;

  unsigned long long stringLength = 3;

  for (i = 0; i < list->length; i++) {
    if (i < list->length -1) {
      digitLength = (unsigned long long)sprintf(digitBuffer, "%llu, ", list->values[i]);
    } else {
      digitLength = (unsigned long long)sprintf(digitBuffer, "%llu", list->values[i]);
    }

    stringLength += digitLength;
  }

  char *result = calloc(stringLength, sizeof(char));

  char *p = result;

  *p = '[';

  p++;

  for (i = 0; i < list->length; i++) {
    if (i < list->length -1) {
      digitLength = (unsigned long long)sprintf(p, "%llu, ", list->values[i]);
    } else {
      digitLength = (unsigned long long)sprintf(p, "%llu", list->values[i]);
    }

    p += digitLength;
  }

  *p = ']';

  p++;

  *p = '\0';

  return result;
}