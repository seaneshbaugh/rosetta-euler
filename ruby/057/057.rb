def approximate_square_root_of_two(expansions)
  if expansions > 0
    Rational(1, 1) + Rational(1, Rational(1 + approximate_square_root_of_two(expansions - 1)))
  else
    Rational(1, 1) + Rational(1 / 2)
  end
end

numerator_longer_than_denominator = (0..999).select do |e|
  r = approximate_square_root_of_two(e)

  r.numerator.to_s.length > r.denominator.to_s.length
end

puts numerator_longer_than_denominator.length
