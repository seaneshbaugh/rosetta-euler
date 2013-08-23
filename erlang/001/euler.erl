#!/usr/bin/env escript

main(_) ->
  io:fwrite("~B~n", [lists:sum(lists:filter(fun(X) -> (X rem 3 == 0) or (X rem 5 ==0) end, lists:seq(1, 999)))]).
