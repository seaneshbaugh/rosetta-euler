"use strict";

function pythagoreanTripleWithSum(sum) {
  var m, n, a, b, c;

  for (m = 2; m < sum + 1; m += 1) {
    for (n = 1; n < m; n += 1) {
      a = (m * m) - (n * n);

      b = 2 * m * n;

      c = (m * m) + (n * n);

      if ((a + b + c === sum) && ((a * a) + (b * b) === (c * c))) {
        return [a, b, c];
      }
    }
  }

  return [];
}

console.log(pythagoreanTripleWithSum(1000).reduce(function(previousValue, currentValue) {
  return previousValue * currentValue;
}));
