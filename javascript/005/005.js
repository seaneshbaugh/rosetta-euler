var i, primeFactorLists, factors, sum;

function primeFactors(x) {
  var i, v;

  v = null;

  for (i = 2; i < x - 1; i++) {
    if (x % i == 0) {
      v = i;

      break;
    }
  }

  if (v) {
    return [v].concat(primeFactors(x / v));
  } else {
    return [x];
  }
}

function overlap(a, b) {
  var i, index, result;

  for (i = 0; i < b.length; i++) {
    index = a.indexOf(b[i]);

    if (index !== -1) {
      a = a.slice(0, index).concat(a.slice(index + 1));
    }
  }

  result = a.concat(b);

  result.sort(function(x, y) {
      return x < y;
  });

  return result;
}

primeFactorLists = [];

for (i = 1; i <= 20; i++) {
  primeFactorLists.push(primeFactors(i));
}

factors = [];

for (i = 0; i < primeFactorLists.length; i++) {
  factors = overlap(factors, primeFactorLists[i]);
}

product = 1;

for (i = 0; i < factors.length; i++) {
  product *= factors[i];
}

console.log(product);
