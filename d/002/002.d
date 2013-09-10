module euler;

import std.stdio;

void main() {
  int[] fibs = [0, 1];

  while (fibs[fibs.length - 1] + fibs[fibs.length - 2] < 4000000) {
    fibs ~= fibs[fibs.length - 1] + fibs[fibs.length - 2];
  }

  int sum = 0;

  for (size_t  i = 0; i < fibs.length; i++) {
    if (fibs[i] % 2 == 0) {
      sum += fibs[i];
    }
  }

  writeln(sum);
}
