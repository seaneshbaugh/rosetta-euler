module euler;

import std.conv;
import std.range;
import std.stdio;

void main() {
  ulong[] palindromes;

  ulong max;

  for (ulong x = 100; x <= 999; x++) {
    for (ulong y = 100; y <= 999; y++) {
      ulong product = x * y;

      string s = to!string(product);

      if (s == s.retro.text) {
        palindromes ~= product;
      }
    }
  }

  max = palindromes[0];

  for (size_t i = 0; i < palindromes.length; i++) {
    if (palindromes[i] > max) {
      max = palindromes[i];
    }
  }

  writeln(max);
}
