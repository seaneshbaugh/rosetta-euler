sum := 0

for (i, 1, 999,
  if (i % 3 == 0 or i % 5 == 0) then (
    sum = sum + i
  )
)

write(sum)

write("\n")
