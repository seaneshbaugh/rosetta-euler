#!/usr/bin/env escript

main(_) ->
  io:fwrite("~B~n", [lists:max(prime_factors(600851475143))]).

prime_factors(N) ->
  prime_factors(N, 2).
prime_factors(N, P) when N < (P * P) ->
  [N];
prime_factors(N, P) when N rem P == 0 ->
  [P | prime_factors(N div P, P) ];
prime_factors(N, P) ->
  prime_factors(N, P + 1).
