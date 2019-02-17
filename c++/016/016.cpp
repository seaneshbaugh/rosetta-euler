#include <gmpxx.h>
#include <iostream>
#include <sstream>
#include <string>

int main() {
  mpz_class n;

  mpz_ui_pow_ui(n.get_mpz_t(), 2, 1000);

  unsigned long total = 0;

  std::string ns = n.get_str();

  for (auto it = ns.begin(); it != ns.end(); ++it) {
    total += static_cast<unsigned long>(*it - '0');
  }

  std::cout << total << std::endl;

  return 0;
}
