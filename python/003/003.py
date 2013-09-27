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

print(max(prime_factors(600851475143)))
