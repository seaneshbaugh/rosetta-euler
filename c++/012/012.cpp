#include <iostream>
#include <map>
#include <vector>

std::vector<unsigned long long> primeFactors(unsigned long long n);

int main() {
  unsigned long long n = 1;

  unsigned long long numberOfDivisors = 0;

  unsigned long long triangleNumber;

  while(numberOfDivisors < 500) {
    n++;

    triangleNumber = 0;

    for (unsigned long long i = 1; i <= n; i++) {
      triangleNumber += i;
    }

    std::vector<unsigned long long> factors = primeFactors(triangleNumber);

    std::map<unsigned long long, unsigned long long> factorLengths;

    std::for_each(factors.begin(), factors.end(), [&](const unsigned long long factor){
      factorLengths[factor] = 0;
    });

    std::for_each(factors.begin(), factors.end(), [&](const unsigned long long factor){
      factorLengths[factor]++;
    });

    numberOfDivisors = 1;

    std::for_each(factorLengths.begin(), factorLengths.end(), [&](const std::pair<unsigned long long, unsigned long long>& pair){
      numberOfDivisors *= pair.second + 1;
    });
  }

  std::cout << triangleNumber << std::endl;

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
