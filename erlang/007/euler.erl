#!/usr/bin/env escript

main(_) ->
  N = 10001,
  Limit = trunc((N * math:log(N)) + (N * (math:log(math:log(N))))),
  io:fwrite("~w~n", [lists:nth(N, sieve_of_eratosthenes(Limit))]).

sieve_of_eratosthenes(Limit) when is_number(Limit), Limit > 1 ->
  sieve_of_eratosthenes(2, round(math:sqrt(Limit)), [], lists:seq(3, Limit, 2)).
sieve_of_eratosthenes(Prime, Limit, Primes, Integers) when Prime > Limit ->
  lists:reverse([Prime | Primes]) ++ Integers;
sieve_of_eratosthenes(Prime, Limit, Primes, Integers) ->
  [NewPrime | NewIntegers] = lists:filter(fun(X) -> X rem Prime /= 0 end, Integers),
  sieve_of_eratosthenes(NewPrime, Limit, [Prime | Primes], NewIntegers).
