fibs := list(0, 1)

while(fibs at(fibs size - 1) + fibs at(fibs size - 2) < 4000000,
    fibs append(fibs at(fibs size - 1) + fibs at(fibs size - 2))
)

write(fibs select(isEven) reduce(sum, x, sum + x))

write("\n")
