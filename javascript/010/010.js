"use strict";

function sieveOfAtkin(limit) {
  var primes, sieve, squareRootOfLimit, x, y, n, i;

  primes = [];

  sieve = [];

  for (x = 0; x < limit; x += 1) {
    sieve.push(false);
  }

  squareRootOfLimit = Math.round(Math.sqrt(limit));

  for (x = 1; x <= squareRootOfLimit; x += 1) {
    for (y = 1; y <= squareRootOfLimit; y += 1) {
      n = (4 * x * x) + (y * y);

      if (n <= limit && (n % 12 === 1 || n % 12 === 5)) {
        sieve[n] = !sieve[n];
      }

      n = (3 * x * x) + (y * y);

      if (n <= limit && n % 12 === 7) {
        sieve[n] = !sieve[n];
      }

      n = (3 * x * x) - (y * y);

      if (x > y && n <= limit && n % 12 === 11) {
        sieve[n] = !sieve[n];
      }
    }
  }

  sieve[2] = true;

  sieve[3] = true;

  primes.push(2);

  primes.push(3);

  n = 5;

  while (n <= squareRootOfLimit) {
    if (sieve[n]) {
      i = n * n;

      while (i < limit) {
        sieve[i] = false;

        i += n * n;
      }

      primes.push(n);
    }

    n += 2;
  }

  while (n < limit) {
    if (sieve[n]) {
      primes.push(n);
    }

    n += 2;
  }

  return primes;
}

console.log(sieveOfAtkin(2000000).reduce(function(previousValue, currentValue) {
  return previousValue + currentValue;
}));
