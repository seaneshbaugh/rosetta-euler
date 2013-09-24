#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "number_list.h"

void primeFactors(unsigned long long n, NumberList *result);

int main(int argc, char *argv[]) {
  NumberList list;

  initializeList(&list);

  primeFactors(600851475143, &list);

  printf("%llu\n", list.values[list.length - 1]);

  deinitializeList(&list);

  return 0;
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
