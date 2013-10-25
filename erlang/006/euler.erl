#!/usr/bin/env escript

main(_) ->
  io:fwrite("~w~n", [trunc(math:pow(lists:foldl(fun(X, Sum) -> X + Sum end, 0, lists:seq(1, 100)), 2) - lists:foldl(fun(X, Sum) -> math:pow(X, 2) + Sum end, 0, lists:seq(1, 100)))]).
