#include <stdio.h>
#include <stdlib.h>
#include "unsigned_long_long_array.h"

int pythagoreanTripleWithSum(UnsignedLongLongArray* sides, unsigned long long sum);

int main(int argc, char *argv[]) {
  UnsignedLongLongArray sides;

  UnsignedLongLongArrayInitialize(&sides);

  pythagoreanTripleWithSum(&sides, 1000);

  unsigned long long product = 1ULL;

  for (size_t i = 0; i < UnsignedLongLongArrayCount(&sides); i++) {
    unsigned long long side;

    UnsignedLongLongArrayAt(&sides, i, &side);

    product *= side;
  }

  printf("%llu\n", product);

  return 0;
}

int pythagoreanTripleWithSum(UnsignedLongLongArray* sides, unsigned long long sum) {
  if (sum < 11) {
    return 0;
  }

  UnsignedLongLongArray ms;

  UnsignedLongLongArrayInitialize(&ms);

  for (unsigned long long i = 2; i <= sum; i++) {
    UnsignedLongLongArrayPush(&ms, i);
  }

  UnsignedLongLongArray ns;

  UnsignedLongLongArrayInitialize(&ns);

  for (unsigned long long i = 1; i < sum; i++) {
    UnsignedLongLongArrayPush(&ns, i);
  }

  for (size_t i = 0; i < UnsignedLongLongArrayCount(&ms); i++) {
    for (size_t j = 0; j < UnsignedLongLongArrayCount(&ns); j++) {
      unsigned long long m;

      UnsignedLongLongArrayAt(&ms, i, &m);

      unsigned long long n;

      UnsignedLongLongArrayAt(&ns, j, &n);

      if (m > n) {
        unsigned long long a = (m * m) - (n * n);

        unsigned long long b = 2 * m * n;

        unsigned long long c = (m * m) + (n * n);

        if ((a + b + c == sum) && ((a * a) + (b * b) == (c * c))) {
          UnsignedLongLongArrayPush(sides, a);

          UnsignedLongLongArrayPush(sides, b);

          UnsignedLongLongArrayPush(sides, c);

          return 1;
        }
      }
    }
  }

  return 0;
}
