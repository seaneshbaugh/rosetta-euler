module euler;

import std.conv;
import std.range;
import std.stdio;

void main() {
  ulong sumOfSquares = 0;

  ulong sum = 0;

  ulong squareOfSum = 0;

  for (ulong i = 1; i <= 100; i++) {
    sumOfSquares += i * i;

    sum += i;
  }

  squareOfSum = sum * sum;

  writeln(squareOfSum - sumOfSquares);
}
