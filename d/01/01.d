module euler;

import std.stdio;

void main() {
  int sum = 0;

  foreach(x; 1..1000) {
    if (x % 3 == 0 || x % 5 == 0) {
      sum += x;
    }
  }

  writeln(sum);
}
