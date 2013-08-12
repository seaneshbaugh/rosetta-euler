class Fixnum
  def prime?
    if !self.integer?
      false
    else
      lower_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

      if lower_primes.include?(self)
        return true
      end

      lower_primes.each do |lower_prime|
        if self % lower_prime == 0
          return false
        end
      end

      upper_margin = Math.sqrt(self).to_i + 1

      current = 101

      begin
        if self % current == 0
          return false
        end

        current += 2
      end while current < upper_margin

      true
    end
  end
end

n = 2

x = 3

last_prime = x

begin
  begin
    is_prime = x.prime?

    unless is_prime
      x += 2
    end
  end while !is_prime

  last_prime = x

  x += 2

  n += 1
end while n < 10001

puts last_prime
