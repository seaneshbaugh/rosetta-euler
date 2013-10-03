function primeFactors(n) {
  var v, i;

  v = null;

  for (i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      v = i;

      break;
    }
  }

  if (v) {
    return [v].concat(primeFactors(Math.floor(n / v)));
  } else {
    return [n];
  }
}

console.log(Math.max.apply(null, primeFactors(600851475143)));
