"use strict";

const pythagoreanTripleWithSum = function(sum) {
  for (let m = 2; m < sum + 1; m += 1) {
    for (let n = 1; n < m; n += 1) {
      const a = (m * m) - (n * n);

      const b = 2 * m * n;

      const c = (m * m) + (n * n);

      if ((a + b + c === sum) && ((a * a) + (b * b) === (c * c))) {
        return [a, b, c];
      }
    }
  }

  return [];
};

console.log(pythagoreanTripleWithSum(1000).reduce((previousValue, currentValue) => previousValue * currentValue));
