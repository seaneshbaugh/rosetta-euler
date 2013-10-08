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

def overlap(a, b):
    for n in b:
        if n in a:
            a.remove(n)

    result = a + b

    result.sort()

    return result

print(reduce(mul, reduce(overlap, map(lambda x: prime_factors(x), range(1, 21)))))
