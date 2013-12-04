module euler;

import std.stdio;

void main() {
  ulong[] factors = [];

  for (ulong i = 1; i <= 20; i++) {
    factors = overlap(factors, primeFactors(i));
  }

  ulong product = 1;

  for (ulong i = 0; i < factors.length; i++) {
    product *= factors[i];
  }

  writeln(product);
}

pure ulong[] primeFactors(ulong n) {
  bool found = false;

  ulong v = 2;

  for (ulong i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      found = true;

      v = i;

      break;
    }
  }

  ulong[] result = [];

  if (found) {
    result ~= v;

    result ~= primeFactors(n / v);
  } else {
    result ~= n;
  }

  return result;
}

pure ulong[] overlap(ulong[] a, ulong[] b){
  for (ulong i = 0; i < b.length; i++) {
    if (a.length == 0) {
      break;
    }

    for (ulong j = 0; j < a.length; j++) {
      if (a[j] == b[i]) {
        if (a.length == 1) {
          a = [];
        } else {
          if (j == 0) {
            a = a[1..a.length];
          } else {
            if (j == a.length - 1) {
              a = a[0..(a.length - 1)];
            } else {
              a = a[0..j] ~ a[(j + 1)..a.length];
            }
          }
        }

        break;
      }
    }
  }

  return a ~ b;
}
