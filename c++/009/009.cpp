#include <iostream>
#include <vector>

std::vector<unsigned long long> pythagoreanTripleWithSum(unsigned long long sum);

int main() {
  const unsigned long long sum = 1000;

  std::vector<unsigned long long> triple = pythagoreanTripleWithSum(sum);

  if (triple.size() == 3) {
    std::cout << triple[0] * triple[1] * triple[2] << std::endl;
  }

  return 0;
}

std::vector<unsigned long long> pythagoreanTripleWithSum(unsigned long long sum) {
  for (unsigned long long m = 2; m < sum + 1; m++) {
    for (unsigned long long n = 1; n < m; n ++) {
      unsigned long long a = (m * m) - (n * n);

      unsigned long long b = 2 * m * n;

      unsigned long long c = (m * m) + (n * n);

      if ((a + b + c == sum) && ((a * a) + (b * b) == (c * c))) {
        return std::vector<unsigned long long> {a, b, c};
      }
    }
  }

  return std::vector<unsigned long long>();
}
