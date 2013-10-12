from operator import mul

def pythagorean_triple_with_sum(sum):
    if sum < 11:
        raise ValueError('The smallest possible sum of a pythagorean triple is 11.')

    ms = list(range(2, sum + 1))

    ns = list(range(1, sum))

    for m in ms:
        for n in ns:
            if m > n:
                a = (m * m) - (n * n)

                b = 2 * m * n

                c = (m * m) + (n * n)

                if (a + b + c == sum) and ((a * a) + (b * b) == (c * c)):
                    return [a, b, c]

    return []

print(reduce(mul, pythagorean_triple_with_sum(1000)))
