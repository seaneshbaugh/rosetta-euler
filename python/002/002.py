fibs = [0, 1]

while fibs[-1] + fibs[-2] < 4000000:
    fibs.append(fibs[-1] + fibs[-2])

print(sum(filter(lambda x: x % 2 == 0, fibs)))
