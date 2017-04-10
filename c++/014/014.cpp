#include <iostream>

unsigned long long collatz(unsigned long long n) {
  if (n <= 1) {
    return 1;
  } else {
    if (n % 2 == 0) {
      return n / 2;
    } else {
      return (3 * n) + 1;
    }
  }
}

int main() {
  unsigned long long maxLength = 1;

  unsigned long long maxStart = 1;

  for (unsigned long long start = 1; start < 1000000; start += 1) {
    unsigned long long length = 1;

    unsigned long long n = start;

    while (n > 1) {
      n = collatz(n);

      length += 1;
    }

    if (length > maxLength) {
      maxLength = length;

      maxStart = start;
    }
  }

  std::cout << maxStart << std::endl;

  return 0;
}
