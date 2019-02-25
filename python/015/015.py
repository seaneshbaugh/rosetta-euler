from operator import mul
from functools import reduce

def binomial_coefficient(top, bottom):
    return reduce(mul, list(range(top - bottom + 1, top + 1))) // reduce(mul, list(range(2, bottom + 1)))

def lattice_paths(m, n):
    if m <= n:
        return binomial_coefficient(m + n, n)
    else:
        return binomial_coefficient(m + n, m)

print(lattice_paths(20, 20))
