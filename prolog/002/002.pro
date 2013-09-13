:- initialization(main).

filter(_, [], []).
filter(Predicate, [Head|Tail], Filtered) :-
  (call(Predicate, Head) ->
    Filtered = [Head|Remaining];
    Filtered = Remaining),
  filter(Predicate, Tail, Remaining).

sum([], 0).
sum([Head|Tail], Sum) :-
  sum(Tail, Rest),
  Sum is Head + Rest.

even(X) :-
  X mod 2 =:= 0.

fibs_less_than(X, [Head|Tail], Fibs) :-
  List = [Head|Tail],
  [TailHead|_] = Tail,
  Next is Head + TailHead,
  (Next < X ->
    fibs_less_than(X, [Next|List], Fibs);
    Fibs = List).
fibs_less_than(X, Fibs) :-
  fibs_less_than(X, [1, 0], Fibs).

main :-
  fibs_less_than(4000000, Fibs),
  filter(even, Fibs, EvenFibs),
  sum(EvenFibs, Sum),
  write(Sum),
  nl,
  halt.
