from operator import mul

def binomial_coefficient(top, bottom):
    return reduce(mul, range(top - bottom + 1, top + 1)) / reduce(mul, range(2, bottom + 1))

def lattice_paths(m, n):
    if m <= n:
        return binomial_coefficient(m + n, n)
    else:
        return binomial_coefficient(m + n, m)

print(lattice_paths(20, 20))
