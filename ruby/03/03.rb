class Fixnum
  def is_prime?
    if !self.integer?
      false
    else
      d = 2

      begin
        if self % d == 0 && self != d
          return false
        end

        d += 1
      end while d < self.div(2)

      true
    end
  end
end

# x = 600851475143
x = 34245345343

y = x # x.div(2)

puts y

begin
  if x % y == 0 && y.is_prime?
    break
  end

  y -= 1
end while y > 1

puts y

# puts (2..600851475143).select { |x| x.is_prime? }
