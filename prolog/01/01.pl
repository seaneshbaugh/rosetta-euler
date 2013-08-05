:- initialization(main).

euler(Start, End, Total) :-
  (Start mod 3 =:= 0; Start mod 5 =:= 0),
  Start < End,
  Next is Start + 1,
  euler(Next, End, NextTotal),
  Total is NextTotal + Start.
euler(Start, End, Total) :-
  Start < End,
  Next is Start + 1,
  euler(Next, End, Total).
euler(N, N, N).

main :-
  euler(1, 999, Answer),
  write(Answer),
  nl,
  halt.
