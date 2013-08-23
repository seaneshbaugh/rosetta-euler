#!/usr/bin/env escript

main(_) ->
  io:fwrite("~B~n", [lists:sum(lists:filter(fun(X) -> (X rem 2 == 0) end, fibs_less_than(4000000)))]).

fibs_less_than(N) ->
  fibs_less_than(N, [1, 0]).
fibs_less_than(N, [H | T]) ->
  [A | _] = T,

  if
    A + H < N ->
      fibs_less_than(N, lists:append([[A + H], [H | T]]));
    true ->
      [H | T]
  end.
