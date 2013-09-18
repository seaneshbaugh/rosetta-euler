#include <stdio.h>

int main(int argc, char *argv[]) {
  unsigned long long sumOfSquares = 0;

  unsigned long long sum = 0;

  unsigned long long squareOfSum = 0;

  for (unsigned long long i = 1; i <= 100; i++) {
    sumOfSquares += (i * i);

    sum += i;
  }

  squareOfSum = sum * sum;

  printf("%llu\n", squareOfSum - sumOfSquares);

  return 0;
}
