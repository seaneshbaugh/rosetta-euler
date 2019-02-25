import operator

def collatz(n):
    if n <= 1:
        return 1
    elif n % 2 == 1:
        return (3 * n) + 1
    else:
        return n / 2

chain_lengths = {}

for start in range(1, 1000001):
    length = 1

    n = start

    while n > 1:
        n = collatz(n)

        length += 1

    chain_lengths[start] = length

print([x[0] for x in sorted(iter(chain_lengths.items()), key = operator.itemgetter(1))][-1:][0])
