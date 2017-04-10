#include <gmpxx.h>
#include <iostream>

mpz_class binomialCoefficient(mpz_class top, mpz_class bottom) {
  mpz_class i = top - bottom + 1;

  mpz_class numerator = mpz_class(1);

  while (i <= top) {
    numerator *= i;

    i += 1;
  }

  i = mpz_class(2);

  mpz_class denominator = mpz_class(1);

  while (i <= bottom) {
    denominator *= i;

    i += 1;
  }

  return numerator / denominator;
}

mpz_class latticePaths(mpz_class m, mpz_class n) {
  if (m < n) {
    return binomialCoefficient(m + n, n);
  } else {
    return binomialCoefficient(m + n, m);
  }
}

int main() {
  mpz_class m = mpz_class(20);

  mpz_class n = mpz_class(20);

  mpz_class result = latticePaths(m, n);

  std::cout << result << std::endl;

  return 0;
}
