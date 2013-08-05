#!/usr/bin/env escript

main(_) ->
  io:fwrite("~B~n", [euler1(999)]).

euler1(X) when X =< 0 -> 0;
euler1(X) when (X rem 3 == 0) or (X rem 5 == 0) -> X + euler1(X - 1);
euler1(X) -> euler1(X - 1).
