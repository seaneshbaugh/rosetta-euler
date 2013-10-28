#!/usr/bin/env escript

main(_) ->
  io:fwrite("~w~n", [lists:foldl(fun(X, Product) -> X * Product end, 1, pythagorean_triple_with_sum(1000))]).

pythagorean_triple_with_sum(Sum) when Sum > 11 ->
  pythagorean_triple_with_sum(Sum, 2, 1).
pythagorean_triple_with_sum(Sum, M, N) when M < Sum, N < Sum - 1, M > N ->
  A = (M * M) - (N * N),
  B = 2 * M * N,
  C = (M * M) + (N * N),
  if
    A + B + C == Sum, (A * A) + (B * B) == (C * C) ->
      [A, B, C];
    true ->
      pythagorean_triple_with_sum(Sum, M, N + 1)
  end;
pythagorean_triple_with_sum(Sum, M, N) when M < Sum, N < Sum - 1 ->
  pythagorean_triple_with_sum(Sum, M + 1, 1);
pythagorean_triple_with_sum(_, _, _) ->
  [].
