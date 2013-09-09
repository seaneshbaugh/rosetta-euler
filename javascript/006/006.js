var i, sumOfSquares, squareOfSums, sum;

sumOfSquares = 0;

sum = 0;

for (i = 1; i <= 100; i++) {
  sumOfSquares += (i * i);

  sum += i;
}

squareOfSum = sum * sum;

console.log(squareOfSum - sumOfSquares);
