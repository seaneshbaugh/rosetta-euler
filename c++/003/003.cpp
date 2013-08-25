#include <iostream>
#include <vector>

std::vector<unsigned long long> primeFactors(unsigned long long n);

int main() {
  std::cout << primeFactors(600851475143).back() << std::endl;

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
