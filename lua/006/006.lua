sum_of_squares = 0

sum = 0

for i = 1, 100, 1 do
   sum_of_squares = sum_of_squares + (i * i)

  sum = sum + i
end

square_of_sum = sum * sum

print(square_of_sum -sum_of_squares)
