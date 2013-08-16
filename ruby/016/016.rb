puts (2 ** 1000).to_s.split('').map{ |digit| digit.to_i }.inject(:+)
