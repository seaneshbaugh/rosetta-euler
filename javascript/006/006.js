"use strict";

let sumOfSquares = 0;

let sum = 0;

for (let i = 1; i <= 100; i += 1) {
  sumOfSquares += (i * i);

  sum += i;
}

let squareOfSum = sum * sum;

console.log(squareOfSum - sumOfSquares);
