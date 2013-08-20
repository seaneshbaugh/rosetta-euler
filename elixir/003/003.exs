defmodule Euler do
  @lower_primes [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

  def max_prime_factor(x) do
    guess = round(:math.sqrt(x))

    if rem(guess, 2) == 0 do
      max_prime_factor_guess(x, guess + 1)
    else
      max_prime_factor_guess(x, guess)
    end
  end

  defp max_prime_factor_guess(_, guess) when guess == 1 do
    1
  end
  defp max_prime_factor_guess(x, guess) when rem(x, guess) == 0 do
    if is_prime(guess) do
      guess
    else
      max_prime_factor_guess(x, guess - 2)
    end
  end
  defp max_prime_factor_guess(x, guess) do
    max_prime_factor_guess(x, guess - 2)
  end

  def is_prime(x) when !is_integer(x) or x < 2 or rem(x, 2) == 0 do
    false
  end
  def is_prime(x) when x in @lower_primes do
    true
  end
  def is_prime(x) do
    if length(Enum.filter(@lower_primes, fn p -> rem(x, p) == 0 end)) != 0 do
      false
    else
      prime_guess(x, 101, round(:math.sqrt(x)))
    end
  end

  defp prime_guess(_, guess, limit) when guess > limit do
    true
  end
  defp prime_guess(x, guess, _) when rem(x, guess) == 0 do
    false
  end
  defp prime_guess(x, guess, limit) do
    prime_guess(x, guess + 2, limit)
  end
end

IO.puts Euler.max_prime_factor(600851475143)
