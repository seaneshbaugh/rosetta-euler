from operator import mul
from functools import reduce

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
        factors = [v] + prime_factors(n // v)
    else:
        factors = [n]

    return factors

def overlap(a, b):
    for n in b:
        if n in a:
            a.remove(n)

    result = sorted(a + b)


    return result

print(reduce(mul, reduce(overlap, [prime_factors(x) for x in range(1, 21)])))
