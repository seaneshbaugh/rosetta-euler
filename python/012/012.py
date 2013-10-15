import itertools
from operator import mul

def prime_factors(n):
    found = False

    v = 2

    i = 2

    while i < n -1 and found == False:
        if n % i == 0:
            found = True

            v = i

        i += 1

    if found:
        factors = [v] + prime_factors(n / v)
    else:
        factors = [n]

    return factors

n = 1

triangle_number = 1

number_of_divisors = 1

while number_of_divisors < 500:
    n += 1

    triangle_number = sum(range(1, n + 1))

    number_of_divisors = reduce(mul, map(lambda x: len(x) + 1, [list(g) for k, g in itertools.groupby(prime_factors(triangle_number))]))

print(triangle_number)
