class Fixnum
  def binomial_coefficient(bottom)
    ((self - bottom + 1)..self).inject(:*) / (2..bottom).inject(:*)
  end
end

def lattice_paths(m, n)
  if m <= n
    (m + n).binomial_coefficient(n)
  else
    (m + n).binomial_coefficient(m)
  end
end

puts lattice_paths(20, 20)
