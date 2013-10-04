"use strict";

var sumOfSquares, sum, i, squareOfSum;

sumOfSquares = 0;

sum = 0;

for (i = 1; i <= 100; i += 1) {
  sumOfSquares += (i * i);

  sum += i;
}

squareOfSum = sum * sum;

console.log(squareOfSum - sumOfSquares);
