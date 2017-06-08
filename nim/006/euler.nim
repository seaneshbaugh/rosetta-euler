var sum_of_squares = 0

var sum = 0

var square_of_sum = 0

for i in 1..100:
  sum_of_squares = sum_of_squares + i * i

  sum = sum + i

square_of_sum = sum * sum

echo(square_of_sum - sum_of_squares)
