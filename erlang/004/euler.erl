#!/usr/bin/env escript

main(_) ->
  Products = lists:flatten(lists:map(fun(X) -> lists:map(fun(Y) -> X * Y end, lists:seq(100, 999)) end, lists:seq(100, 999))),
  Palindromes = lists:filter(fun(X) -> integer_to_list(X) == lists:reverse(integer_to_list(X)) end, Products),
  io:fwrite("~B~n", [lists:max(Palindromes)]).
