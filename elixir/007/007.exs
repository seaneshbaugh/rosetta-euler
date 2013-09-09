defmodule Euler do
  def sieve_of_eratosthenes(limit) when is_number(limit) and limit > 1 do
    sieve_of_eratosthenes(2, round(:math.sqrt(limit)), [], :lists.seq(3, limit, 2))
  end

  defp sieve_of_eratosthenes(prime, limit, primes, integers) when prime > limit do
    :lists.reverse([prime | primes]) ++ integers
  end

  defp sieve_of_eratosthenes(prime, limit, primes, integers) do
    [new_prime | new_integers] = integers |> Enum.filter(fn x -> rem(x, prime) != 0 end)

    sieve_of_eratosthenes(new_prime, limit, [prime | primes], new_integers)
  end
end

n = 10001

limit = trunc((n * :math.log(n)) + (n * (:math.log(:math.log(n)))))

IO.puts Euler.sieve_of_eratosthenes(limit)
|> Enum.at(n - 1)
|> to_string
