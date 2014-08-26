#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "unsigned_long_long_array.h"

void primeFactors(unsigned long long n, UnsignedLongLongArray *result);

int main(int argc, char *argv[]) {
  UnsignedLongLongArray primeFactorLists[20];

  UnsignedLongLongArray factors;

  UnsignedLongLongArrayInitialize(&factors);

  unsigned long long i;

  for (i = 1; i <= 20; i++) {
    UnsignedLongLongArrayInitialize(&primeFactorLists[i - 1]);

    primeFactors(i, &primeFactorLists[i - 1]);

    UnsignedLongLongArrayOverlap(&factors, &primeFactorLists[i - 1]);

    UnsignedLongLongArrayDeinitialize(&primeFactorLists[i - 1]);
  }

  unsigned long long product = 1;

  for (i = 0; i < factors.length; i++) {
    product *= factors.values[i];
  }

  printf("%llu\n", product);

  UnsignedLongLongArrayDeinitialize(&factors);

  return 0;
}

void primeFactors(unsigned long long n, UnsignedLongLongArray *result) {
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
    UnsignedLongLongArrayPush(result, v);

    primeFactors(n / v, result);
  } else {
    UnsignedLongLongArrayPush(result, n);
  }
}
