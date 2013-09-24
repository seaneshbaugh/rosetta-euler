#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "number_list.h"

void primeFactors(unsigned long long n, NumberList *result);

int main(int argc, char *argv[]) {
  NumberList primeFactorLists[20];

  NumberList factors;

  initializeList(&factors);

  unsigned long long i;

  for (i = 1; i <= 20; i++) {
    initializeList(&primeFactorLists[i - 1]);

    primeFactors(i, &primeFactorLists[i - 1]);

    overlap(&factors, &primeFactorLists[i - 1]);

    deinitializeList(&primeFactorLists[i - 1]);
  }

  unsigned long long product = 1;

  for (i = 0; i < factors.length; i++) {
    product *= factors.values[i];
  }

  printf("%llu\n", product);

  deinitializeList(&factors);

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
