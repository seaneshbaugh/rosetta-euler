#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "unsigned_long_long_array.h"

typedef struct {
  unsigned long long value;
  size_t count;
} FactorCount;

void primeFactors(unsigned long long n, UnsignedLongLongArray *result);
unsigned long long numberOfDivisors(unsigned long long n);

int main(int argc, char *argv[]) {
  size_t i = 2;

  unsigned long long triangleNumber = 1;

  while (numberOfDivisors(triangleNumber) <= 500) {
    triangleNumber = 0;

    for (size_t j = 1; j <= i; j += 1) {
      triangleNumber += j;
    }

    i += 1;
  }

  printf("%llu\n", triangleNumber);

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

unsigned long long numberOfDivisors(unsigned long long n) {
  UnsignedLongLongArray factors;

  UnsignedLongLongArrayInitialize(&factors);

  primeFactors(n, &factors);

  FactorCount *factorGroups;

  factorGroups = calloc(UnsignedLongLongArrayCount(&factors), sizeof(FactorCount));

  for (size_t i = 0; i < UnsignedLongLongArrayCount(&factors); i++) {
    unsigned long long factor;

    UnsignedLongLongArrayAt(&factors, i, &factor);

    for (size_t j = 0; j < UnsignedLongLongArrayCount(&factors); j++) {
      if (factorGroups[j].value == factor) {
        break;
      }

      if (factorGroups[j].value == 0ULL) {
        factorGroups[j].value = factor;

        factorGroups[j].count = 1;

        break;
      }
    }
  }

  for (size_t i = 0; i < UnsignedLongLongArrayCount(&factors); i++) {
    unsigned long long factor;

    UnsignedLongLongArrayAt(&factors, i, &factor);

    for (size_t j = 0; j < UnsignedLongLongArrayCount(&factors); j++) {
      if (factorGroups[j].value == factor) {
        factorGroups[j].count += 1;

        break;
      }
    }
  }

  unsigned long long result = 1;

  for (size_t i = 0; i < UnsignedLongLongArrayCount(&factors); i++) {
    if (factorGroups[i].count != 0ULL) {
      result *= factorGroups[i].count;
    }
  }

  free(factorGroups);

  UnsignedLongLongArrayDeinitialize(&factors);

  return result;
}
