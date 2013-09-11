write(Range 1 to(999) asList select(x, x % 3 == 0 or x % 5 == 0) reduce(sum, x, sum + x))

write("\n")
