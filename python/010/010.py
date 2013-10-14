import math

def sieve_of_atkin(limit):
    primes = []

    sieve = [False] * limit

    square_root_of_limit = int(math.sqrt(limit))

    for x in range(1, square_root_of_limit + 1):
        for y in range(1, square_root_of_limit + 1):
            n = (4 * x * x) + (y * y)

            if n <= limit and (n % 12 == 1 or n % 12 == 5):
                sieve[n] = not sieve[n]

            n = (3 * x * x) + (y * y)

            if n <= limit and n % 12 == 7:
                sieve[n] = not sieve[n]

            n = (3 * x * x) - (y * y)

            if x > y and n <= limit and n % 12 == 11:
                sieve[n] = not sieve[n]

    sieve[2] = True

    sieve[3] = True

    primes.append(2)

    primes.append(3)

    n = 5

    while n <= square_root_of_limit:
        if sieve[n]:
            i = n * n

            while i < limit:
                sieve[i] = False

                i += n * n

            primes.append(n)

        n += 2

    while n < limit:
        if sieve[n]:
            primes.append(n)

        n += 2

    return primes

print(sum(sieve_of_atkin(2000000)))
