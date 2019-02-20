digit_factorials = [[0, 1]].concat((1..9).map { |digit| [digit, (1..digit).inject(:*)] }).to_h

limit = digit_factorials[9] * (digit_factorials[9].to_s.split('').length + 1)

puts (10..limit).select { |x| x.to_s.split('').map { |digit| digit_factorials[digit.to_i] }.inject(:+) == x }.inject(:+)
