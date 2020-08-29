"use strict";

const sieveOfAtkin = function(limit) {
  let primes = [];

  let sieve = [];

  for (let x = 0; x < limit; x += 1) {
    sieve.push(false);
  }

  const squareRootOfLimit = Math.round(Math.sqrt(limit));

  let n = 0;

  for (let x = 1; x <= squareRootOfLimit; x += 1) {
    for (let y = 1; y <= squareRootOfLimit; y += 1) {
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
      let i = n * n;

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
};

const n = 10001;

console.log(sieveOfAtkin(Math.round(((n * Math.log(n)) + (n * (Math.log(Math.log(n)))))))[n - 1]);
