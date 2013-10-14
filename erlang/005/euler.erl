#!/usr/bin/env escript

main(_) ->
  io:fwrite("~w~n", [lists:foldl(fun(X, Acc) -> X * Acc end, 1, lists:foldl(fun(X, Acc) -> list_overlap(X, Acc) end, [], lists:map(fun(X) -> prime_factors(X) end, lists:seq(1, 20))))]).

prime_factors(N) ->
  prime_factors(N, 2).
prime_factors(N, P) when N < (P * P) ->
  [N];
prime_factors(N, P) when N rem P == 0 ->
  [P | prime_factors(N div P, P) ];
prime_factors(N, P) ->
  prime_factors(N, P + 1).

list_overlap([H | T], []) ->
  [H | T];
list_overlap([], [H | T]) ->
  [H | T];
list_overlap([HA | TA], [HB | TB]) ->
  lists:sort(lists:append([HA | TA], overlap([HA | TA], [HB | TB]))).
overlap([H | T], []) ->
  [H | T];
overlap([], [H | T]) ->
  [H | T];
overlap([HA | TA], [HB | TB]) ->
  overlap(TA, lists:delete(HA, [HB | TB])).
