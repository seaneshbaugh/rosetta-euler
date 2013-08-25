#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

int main() {
  std::vector<unsigned long long> products;

  for (unsigned long long x = 100; x < 1000; x++) {
    for (unsigned long long y = 100; y < 1000; y++) {
      products.push_back(x * y);
    }
  }

  std::vector<unsigned long long> palindromes;

  std::copy_if(products.begin(), products.end(), back_inserter(palindromes), [](const unsigned long long n) {
    std::string s = std::to_string(n);
    std::string r = std::string(s.rbegin(), s.rend());

    return s == r;
  });

  std::sort(palindromes.begin(), palindromes.end());

  std::cout << palindromes.back() << std::endl;

  return 0;
}
