function primeFactors(n) {
  var found, v, i, result;

  found = false;

  v = 2;

  for (i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      found = true;

      v = i;

      break;
    }
  }

  result = [];

  if (found) {
    result.push(v);

    result = result.concat(primeFactors(Math.round(n / v)));

  } else {
    result.push(n);
  }

  return result;
}

console.log(primeFactors(600851475143).slice(-1)[0]);
