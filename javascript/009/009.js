var triple;

function pythagoreanTripleWithSum(sum) {
  var m, n, a, b, c;

  for (m = 2; m < sum + 1; m++) {
    for (n = 1; n < m; n++) {
      a = (m * m) - (n * n);

      b = 2 * m * n;

      c = (m * m) + (n * n);

      if ((a + b + c == sum) && ((a * a) + (b * b) == (c * c))) {
        return [a, b, c];
      }
    }
  }

  return [];
}

triple = pythagoreanTripleWithSum(1000);

console.log(triple[0] * triple[1] * triple[2]);
