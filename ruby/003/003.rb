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

x = 600851475143

guess = Math.sqrt(x).to_i

if guess.even?
  guess += 1
end

begin
  if x % guess == 0 && guess.prime?
    break
  end

  guess -= 2
end while guess > 1

puts guess