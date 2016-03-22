#include <gmp.h>
#include <stdio.h>
#include <stdlib.h>

void binomialCoefficient(mpz_ptr result, mpz_t top, mpz_t bottom) {
  mpz_t i;

  mpz_init(i);

  mpz_sub(i, top, bottom);

  mpz_add_ui(i, i, 1);

  mpz_t numerator;

  mpz_init_set_ui(numerator, 1);

  while (mpz_cmp(i, top) < 1) {
    mpz_mul(numerator, numerator, i);

    mpz_add_ui(i, i, 1);
  }

  mpz_set_ui(i, 2);

  mpz_t denominator;

  mpz_init_set_ui(denominator, 1);

  while (mpz_cmp(i, bottom) < 1) {
    mpz_mul(denominator, denominator, i);

    mpz_add_ui(i, i, 1);
  }

  mpz_fdiv_q(result, numerator, denominator);

  mpz_clear(i);

  mpz_clear(numerator);

  mpz_clear(denominator);
}

void latticePaths(mpz_ptr result, mpz_t m, mpz_t n) {
  mpz_t mplusn;

  mpz_init(mplusn);

  mpz_add(mplusn, m, n);

  if (mpz_cmp(m, n) < 1) {
    binomialCoefficient(result, mplusn, n);
  } else {
    binomialCoefficient(result, mplusn, m);
  }

  mpz_clear(mplusn);
}

int main(int argc, char *argv[]) {
  mpz_t m;

  mpz_init_set_ui(m, 20);

  mpz_t n;

  mpz_init_set_ui(n, 20);

  mpz_t result;

  mpz_init(result);

  latticePaths(result, m, n);

  printf("%s\n", mpz_get_str(NULL, 10, result));

  mpz_clear(m);

  mpz_clear(n);

  mpz_clear(result);

  return 0;
}
