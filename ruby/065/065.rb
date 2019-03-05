eulers_number = Enumerator.new do |y|
  y << 2

  k = 1

  loop do
    y << 1

    y << 2 * k

    k += 1

    y << 1
  end
end

e = eulers_number.take(100)

d = Rational(e.shift, 1)

r = e.reverse.inject do |memo, i|
  memo = Rational(1, memo) unless memo.is_a?(Rational)

  Rational(1, i + memo)
end

convergent = d + r

puts convergent.numerator.digits.inject(:+)
