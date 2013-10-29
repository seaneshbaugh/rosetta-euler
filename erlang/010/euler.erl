#!/usr/bin/env escript

main(_) ->
  io:fwrite("~w~n", [lists:foldl(fun(X, Sum) -> X + Sum end, 0, sieve_of_eratosthenes(2000000))]).

sieve_of_eratosthenes(Limit) when is_number(Limit), Limit > 1 ->
  sieve_of_eratosthenes(2, round(math:sqrt(Limit)), [], lists:seq(3, Limit, 2)).
sieve_of_eratosthenes(Prime, Limit, Primes, Integers) when Prime > Limit ->
  lists:reverse([Prime | Primes]) ++ Integers;
sieve_of_eratosthenes(Prime, Limit, Primes, Integers) ->
  [NewPrime | NewIntegers] = lists:filter(fun(X) -> X rem Prime /= 0 end, Integers),
  sieve_of_eratosthenes(NewPrime, Limit, [Prime | Primes], NewIntegers).
