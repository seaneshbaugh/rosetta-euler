#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "number_list.h"

void sieveOfAtkin(NumberList *primes, unsigned long long limit);

int main(int argc, char *argv[]) {
  unsigned long long n = 10001;

  unsigned long long limit = (unsigned long long)((n * log(n)) + (n * (log(log(n)))));

  NumberList primes;

  initializeList(&primes);

  sieveOfAtkin(&primes, limit);

  printf("%llu\n", primes.values[n - 1]);

  deinitializeList(&primes);

  return 0;
}

void sieveOfAtkin(NumberList *primes, unsigned long long limit) {
  bool *sieve = calloc(limit, sizeof(bool));

  unsigned long long squareRootOfLimit = (unsigned long long)sqrt(limit);

  unsigned long long n;

  for (unsigned long long x = 1; x <= squareRootOfLimit; x++) {
    for (unsigned long long y = 1; y <= squareRootOfLimit; y++) {
      n = (4 * x * x) + (y * y);

      if (n <= limit && (n % 12 == 1 || n % 12 == 5)) {
        sieve[n] = !sieve[n];
      }

      n = (3 * x * x) + (y * y);

      if (n <= limit && n % 12 == 7) {
        sieve[n] = !sieve[n];
      }

      n = (3 * x * x) - (y * y);

      if (x > y && n <= limit && n % 12 == 11) {
        sieve[n] = !sieve[n];
      }
    }
  }

  sieve[2] = true;

  sieve[3] = true;

  push(primes, 2);

  push(primes, 3);

  n = 5;

  while (n <= squareRootOfLimit) {
    if (sieve[n]) {
      unsigned long long i = n * n;

      while (i < limit) {
        sieve[i] = false;

        i += n * n;
      }

      push(primes, n);
    }

    n += 2;
  }

  while (n < limit) {
    if (sieve[n]) {
      push(primes, n);
    }

    n += 2;
  }

  free(sieve);
}
