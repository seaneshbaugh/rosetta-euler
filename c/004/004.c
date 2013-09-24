#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "number_list.h"

void strrev(char *s);

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

  sortAscending(&palindromes);

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
