#include <stdio.h>

void euler2(int *x, int *y, int *sum, int limit) {
  if ((*y) % 2 == 0) {
    (*sum) += (*y);
  }

  if ((*x) + (*y) < limit) {
    int next = (*x) + (*y);

    euler2(y, &next, sum, limit);
  }
}

int main(int argc, char *argv[]) {
  int x = 0;
  int y = 1;
  int sum = 0;

  euler2(&x, &y, &sum, 4000000);

  printf("%d\n", sum);

  return 0;
}
