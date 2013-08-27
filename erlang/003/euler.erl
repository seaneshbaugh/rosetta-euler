#!/usr/bin/env escript

-define(LOWER_PRIMES, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]).

main(_) ->
  io:fwrite("~B~n", [max_prime_factor(600851475143)]).

max_prime_factor(X) ->
  Guess = round(math:sqrt(X)),

  if
    Guess rem 2 == 0 ->
      max_prime_factor(X, Guess + 1);
    true ->
      max_prime_factor(X, Guess)
  end.

max_prime_factor(_X, Guess) when Guess == 1 ->
  1;
max_prime_factor(X, Guess) when X rem Guess == 0 ->
  IsPrime = is_prime(Guess),

  if
    IsPrime == true ->
      Guess;
    true ->
      max_prime_factor(X, Guess - 2)
  end;
max_prime_factor(X, Guess) ->
  max_prime_factor(X, Guess - 2).

is_prime(X) when (is_integer(X) == false) or (X < 2) or ((X rem 2 == 0) and (X /= 2)) ->
  false;
is_prime(X) when X < 101 ->
  lists:member(X, ?LOWER_PRIMES);
is_prime(X) ->
  NumberOfLowerPrimesDivisibleBy = length(lists:filter(fun(Y) -> (X rem Y == 0) end, ?LOWER_PRIMES)),

  if
    NumberOfLowerPrimesDivisibleBy /= 0 ->
      false;
    true ->
      prime_guess(X, 101, round(math:sqrt(X)))
  end.

prime_guess(_, Guess, Limit) when Guess > Limit ->
  true;
prime_guess(X, Guess, _) when X rem Guess == 0 ->
  false;
prime_guess(X, Guess, Limit) ->
  prime_guess(X, Guess + 2, Limit).
