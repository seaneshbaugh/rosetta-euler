"use strict";

const collatz = function(n) {
  if (n <= 1 ) {
    return 1;
  } else {
    if (n % 2 !== 0) {
      return (3 * n) + 1;
    } else {
      return ~~(n / 2);
    }
  }
};

const chainLengths = {};

for (let start = 1; start < 1000000; start += 1) {
  let length = 1;

  let n = start;

  while (n > 1) {
    n = collatz(n);

    length += 1;
  }

  chainLengths[start.toString()] = length;
}

console.log(Object.keys(chainLengths)
  .map((start) => [start, chainLengths[start]])
  .sort((a, b) => a[1] - b[1])
  .slice(-1)[0][0]);
