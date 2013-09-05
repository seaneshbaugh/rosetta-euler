digit_canceling_fractions = []

(10..98).each do |n|
  (n + 1..99).each do |d|
    n_digits = n.to_s.split(//)

    d_digits = d.to_s.split(//)

    common = false

    n_digits.each do |digit|
      if d_digits.include?(digit) && digit != '0'
        common = digit

        n_digits.delete(common)

        d_digits.delete(common)

        break
      end
    end

    if common
      n = n.to_f

      d = d.to_f

      q1 = n / d

      x = n_digits.join.to_f

      y = d_digits.join.to_f

      q2 = x / y

      if q1 == q2
        digit_canceling_fractions << [n.to_i, d.to_i, x.to_i, y.to_i]
      end
    end
  end
end

n_product = digit_canceling_fractions.map { |f| f[2] }.inject(:*)

d_product = digit_canceling_fractions.map { |f| f[3] }.inject(:*)

puts d_product / n_product.gcd(d_product)
