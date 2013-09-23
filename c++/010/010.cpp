#include <iostream>
#include <vector>
#include <complex>
#include <numeric>

std::vector<unsigned long long> sieveOfAtkin(unsigned long long limit);

int main() {
  unsigned long long limit = 2000000;

  std::vector<unsigned long long> primes = sieveOfAtkin(limit);

  unsigned long long sum = 0;

  std::for_each(primes.begin(), primes.end(), [&](const unsigned long long n){
    sum += n;
  });

  std::cout << sum << std::endl;

  return 0;
}

std::vector<unsigned long long> sieveOfAtkin(unsigned long long limit) {
  std::vector<unsigned long long> primes;

  std::vector<bool> sieve(limit, false);

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

  primes.push_back(2);

  primes.push_back(3);

  n = 5;

  while (n <= squareRootOfLimit) {
    if (sieve[n]) {
      unsigned long long i = n * n;

      while (i < limit) {
        sieve[i] = false;

        i += n * n;
      }

      primes.push_back(n);
    }

    n += 2;
  }

  while (n < limit) {
    if (sieve[n]) {
      primes.push_back(n);
    }

    n += 2;
  }

  return primes;
}
