#include <iostream>
#include <vector>

int main() {
  std::vector<int> n = {0, 1};

  while (n[n.size() - 1] + n[n.size() - 2] < 4000000) {
    n.push_back(n[n.size() - 1] + n[n.size() - 2]);
  }

  int sum = 0;

  for (std::vector<int>::iterator it = n.begin(); it != n.end(); ++it) {
    if (*it % 2 == 0) {
      sum += *it;
    }
  }

  std::cout << sum << std::endl;

  return 0;
}