puts ((1..100).sum ** 2).to_i64 - (1..100).map { |x| x ** 2 }.sum.to_i64
