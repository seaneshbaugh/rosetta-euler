#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "unsigned_long_long_array.h"

int ascendingCompare(const void *a, const void *b);
void strrev(char *s);

int main(int argc, char *argv[]) {
  UnsignedLongLongArray palindromes;

  UnsignedLongLongArrayInitialize(&palindromes);

  for (unsigned long long i = 100; i < 1000; i++) {
    for (unsigned long long j = 100; j < 1000; j++) {
      unsigned long long product = i * j;

      char s[7];

      sprintf(s, "%llu", i * j);

      char r[7];

      strcpy(r, s);

      strrev(r);

      if (strcmp(s, r) == 0) {
        UnsignedLongLongArrayPush(&palindromes, product);
      }
    }
  }

  UnsignedLongLongArraySort(&palindromes, ascendingCompare);

  printf("%llu\n", palindromes.values[palindromes.length - 1]);

  UnsignedLongLongArrayDeinitialize(&palindromes);

  return 0;
}

int ascendingCompare(const void *a, const void *b) {
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
