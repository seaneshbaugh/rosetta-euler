puts (1..100).inject(:*).to_s.split(//).map { |digit| digit.to_i }.inject(:+)
