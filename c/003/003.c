#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "unsigned_long_long_array.h"

void primeFactors(unsigned long long n, UnsignedLongLongArray *result);

int main(int argc, char *argv[]) {
  UnsignedLongLongArray factors;

  UnsignedLongLongArrayInitialize(&factors);

  primeFactors(600851475143ULL, &factors);

  printf("%llu\n", factors.values[factors.length - 1]);

  UnsignedLongLongArrayDeinitialize(&factors);

  return 0;
}

void primeFactors(unsigned long long n, UnsignedLongLongArray *result) {
  bool found = false;

  unsigned long long v = 2ULL;

  for (unsigned long long i = 2ULL; i < n - 1ULL; i++) {
    if (n % i == 0ULL) {
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
