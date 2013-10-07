import itertools

print(max(filter(lambda x: str(x) == str(x)[::-1], itertools.chain.from_iterable(map(lambda x: map(lambda y: x * y, range(100, 1000)), range(100, 1000))))))
