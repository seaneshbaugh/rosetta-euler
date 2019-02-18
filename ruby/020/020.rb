puts (1..100).inject(:*).to_s.split('').map(&:to_i).inject(:+)
