#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "unsigned_long_long_array.h"

void sieveOfAtkin(UnsignedLongLongArray *primes, unsigned long long limit);

int main(int argc, char *argv[]) {
  UnsignedLongLongArray primes;

  UnsignedLongLongArrayInitialize(&primes);

  sieveOfAtkin(&primes, 2000000ULL);

  unsigned long long sum = 0ULL;

  for (size_t i = 0; i < UnsignedLongLongArrayCount(&primes); i++) {
    unsigned long long n;

    UnsignedLongLongArrayAt(&primes, i, &n);

    sum += n;
  }

  printf("%llu\n", sum);

  UnsignedLongLongArrayDeinitialize(&primes);

  return 0;
}

void sieveOfAtkin(UnsignedLongLongArray *primes, unsigned long long limit) {
  UnsignedLongLongArray sieve;

  UnsignedLongLongArrayInitialize(&sieve);

  unsigned long long squareRootOfLimit;

  unsigned long long x;

  unsigned long long y;

  unsigned long long n;

  unsigned long long i;

  unsigned long long v;

  for (x = 0ULL; x < limit; x += 1ULL) {
    UnsignedLongLongArrayPush(&sieve, 0ULL);
  }

  squareRootOfLimit = (unsigned long long)ceil(sqrt((double)limit));

  for (x = 1ULL; x <= squareRootOfLimit; x += 1ULL) {
    for (y = 1ULL; y <= squareRootOfLimit; y += 1ULL) {
      n = (4ULL * x * x) + (y * y);

      if (n <= limit && (n % 12ULL == 1ULL || n % 12ULL == 5ULL)) {
        UnsignedLongLongArrayAt(&sieve, n, &v);

        v = !v;

        UnsignedLongLongArraySet(&sieve, n, v);
      }

      n = (3ULL * x * x) + (y * y);

      if (n <= limit && n % 12ULL == 7ULL) {
        UnsignedLongLongArrayAt(&sieve, n, &v);

        v = !v;

        UnsignedLongLongArraySet(&sieve, n, v);
      }

      n = (3ULL * x * x) - (y * y);

      if (x > y && n <= limit && n % 12ULL == 11ULL) {
        UnsignedLongLongArrayAt(&sieve, n, &v);

        v = !v;

        UnsignedLongLongArraySet(&sieve, n, v);
      }
    }
  }

  UnsignedLongLongArraySet(&sieve, 2, 1ULL);

  UnsignedLongLongArraySet(&sieve, 3, 1ULL);

  UnsignedLongLongArrayPush(primes, 2ULL);

  UnsignedLongLongArrayPush(primes, 3ULL);

  n = 5ULL;

  while (n <= squareRootOfLimit) {
    UnsignedLongLongArrayAt(&sieve, n, &v);

    if (v) {
      i = n * n;

      while (i < limit) {
        UnsignedLongLongArraySet(&sieve, i, 0ULL);

        i += n * n;
      }

      UnsignedLongLongArrayPush(primes, n);
    }

    n += 2ULL;
  }

  while (n < limit) {
    UnsignedLongLongArrayAt(&sieve, n, &v);

    if (v) {
      UnsignedLongLongArrayPush(primes, n);
    }

    n += 2ULL;
  }

  UnsignedLongLongArrayDeinitialize(&sieve);
}
