module euler;

import std.stdio;

void main() {
  ulong[] factors = primeFactors(600851475143);

  ulong max = factors[factors.length - 1];

  for (size_t i = 0; i < factors.length; i++) {
    if (factors[i] > max) {
      max = factors[i];
    }
  }

  writeln(max);
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
