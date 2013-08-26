#include <iostream>
#include <vector>
#include <algorithm>

std::vector<unsigned long long> primeFactors(unsigned long long n);

std::vector<unsigned long long> overlap(std::vector<unsigned long long> a, std::vector<unsigned long long> b);

int main() {
  std::vector<unsigned long long> factors;

  for (unsigned long long i = 1; i <= 20; i++) {
    factors = overlap(primeFactors(i), factors);
  }

  unsigned long long product = 1;

  for (std::vector<unsigned long long>::iterator it = factors.begin(); it != factors.end(); ++it) {
    product *= *it;
  }

  std::cout << product << std::endl;

  return 0;
}

std::vector<unsigned long long> primeFactors(unsigned long long n) {
  bool found = false;

  unsigned long long v = 2;

  for (unsigned long long i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      found = true;

      v = i;

      break;
    }
  }

  std::vector<unsigned long long> result;

  if (found) {
    result.push_back(v);

    std::vector<unsigned long long> moreFactors = primeFactors(n / v);

    result.insert(result.end(), moreFactors.begin(), moreFactors.end());
  } else {
    result.push_back(n);
  }

  return result;
}

std::vector<unsigned long long> overlap(std::vector<unsigned long long> a, std::vector<unsigned long long> b) {
  for (std::vector<unsigned long long>::iterator it = b.begin(); it != b.end(); ++it) {
    auto value = std::find(a.begin(), a.end(), *it);

    if (value != a.end()) {
      a.erase(value);
    }
  }

  std::vector<unsigned long long> result;

  a.insert(a.end(), b.begin(), b.end());

  std::sort(a.begin(), a.end());

  return a;
}
