require 'set'

def sieve_of_atkin(limit)
  primes = []

  sieve = Array.new(limit + 1) { false }

  square_root_of_limit = Math.sqrt(limit).to_i

  (1..square_root_of_limit).each do |x|
    (1..square_root_of_limit).each do |y|
      n = (4 * x * x) + (y * y)

      if n <= limit && (n % 12 == 1 || n % 12 == 5)
        sieve[n] = !sieve[n]
      end

      n = (3 * x * x) + (y * y)

      if n <= limit && n % 12 == 7
        sieve[n] = !sieve[n]
      end

      n = (3 * x * x) - (y * y)

      if x > y && n <= limit && n % 12 == 11
        sieve[n] = !sieve[n]
      end
    end
  end

  sieve[2] = true

  sieve[3] = true

  primes << 2

  primes << 3

  n = 5

  while n <= square_root_of_limit do
    if sieve[n]
      i = n * n

      while i < limit do
        sieve[i] = false

        i += n * n
      end

      primes << n
    end

    n += 2
  end

  while n < limit do
    if sieve[n]
      primes << n
    end

    n += 2
  end

  primes
end

class Integer
  def self.witness(a, n)
    t = 0

    u = n - 1

    loop do
      break unless (u & 1) == 0

      t += 1

      u >>= 1
    end

    xi1 = modular_exp(a, u, n)

    i = 0

    loop do
      break unless i < t

      xi2 = xi1 * xi1 % n

      return true if (xi2 == 1) && (xi1 != 1) && (xi1 != (n - 1))

      xi1 = xi2

      i += 1
    end

    return true if xi1 != 1

    false
  end

  def self.modular_exp(a, b, n)
    d = 1

    k = 0

    loop do
      break unless (b >> k) > 0

      k += 1
    end

    i = k - 1

    loop do
      break unless i >= 0
         d = d * d % n

         d = d * a % n if ((b >> i) & 1) > 0

      i -= 1
    end

    d
  end

  # This is based on the Rabin-Miller primality test. It's ugly because doing the modulo division tests in any kind of a loop doubled te running time of the solution.
  def prime?
    return false if self <= 1
    return true if self == 2
    return false if self % 2 == 0
    return true if self < 9
    return false if self % 3 == 0
    return false if self % 5 == 0
    return true if [7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101].include?(self)
    return false if self % 7 == 0
    return false if self % 11 == 0
    return false if self % 13 == 0
    return false if self % 17 == 0
    return false if self % 19 == 0
    return false if self % 23 == 0
    return false if self % 29 == 0
    return false if self % 31 == 0
    return false if self % 37 == 0
    return false if self % 41 == 0
    return false if self % 43 == 0
    return false if self % 47 == 0
    return false if self % 53 == 0
    return false if self % 59 == 0
    return false if self % 61 == 0
    return false if self % 67 == 0
    return false if self % 71 == 0
    return false if self % 73 == 0
    return false if self % 79 == 0
    return false if self % 83 == 0
    return false if self % 89 == 0
    return false if self % 97 == 0
    return false if self % 101 == 0

    ar = [2, 3]

    ar.each do |i|
      return false if Integer.witness(i, self)
    end

    true
  end

  def concat(other)
    (self.to_s + other.to_s).to_i
  end
end

def make_pairs(primes, a)
  pairs = Set.new

  ((a + 1)..(primes.length - 1)).each do |b|
    if primes[a].concat(primes[b]).prime? && primes[b].concat(primes[a]).prime?
      pairs.add(primes[b])
    end
  end

  pairs
end

primes = sieve_of_atkin(30000)

result = 2 ** 64

pairs = Array.new(primes.length)

(1..(primes.length - 1)).each do |a|
  break if primes[a] * 5 >= result

  pairs[a] = make_pairs(primes, a) if pairs[a].nil?

  ((a + 1)..(primes.length - 1)).each do |b|
    break if primes[a] + primes[b] * 4 >= result

    next if !pairs[a].include?(primes[b])

    pairs[b] = make_pairs(primes, b) if pairs[b].nil?

    ((b + 1)..(primes.length - 1)).each do |c|
      break if primes[a] + primes[b] + primes[c] * 3 >= result

      next if !pairs[a].include?(primes[c]) || !pairs[b].include?(primes[c])

      pairs[c] = make_pairs(primes, c) if pairs[c].nil?

      ((c + 1)..(primes.length - 1)).each do |d|
        break if primes[a] + primes[b] + primes[c] + primes[d] * 2 >= result

        next if !pairs[a].include?(primes[d]) || !pairs[b].include?(primes[d]) || !pairs[c].include?(primes[d])

        pairs[d] = make_pairs(primes, d) if pairs[d].nil?

        ((d + 1)..(primes.length - 1)).each do |e|
          break if primes[a] + primes[b] + primes[c] + primes[d] + primes[e] >= result

          next if !pairs[a].include?(primes[e]) || !pairs[b].include?(primes[e]) || !pairs[c].include?(primes[e]) || !pairs[d].include?(primes[e])

          if result > primes[a] + primes[b] + primes[c] + primes[d] + primes[e]
            result = primes[a] + primes[b] + primes[c] + primes[d] + primes[e]

            break
          end
        end
      end
    end
  end
end

puts result
