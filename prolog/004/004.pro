:- initialization(main).

number_is_palindrome(Number) :-
    number_chars(Number, Digits),
    reverse(Digits, ReversedDigits),
    Digits = ReversedDigits.

filter_palindromes([], []).

filter_palindromes([H | T], Palindromes) :-
    number_is_palindrome(H),
    filter_palindromes(T, RemainingPalindromes),
    Palindromes = [H | RemainingPalindromes].

filter_palindromes([_ | T], Palindromes) :-
    filter_palindromes(T, Palindromes).

range(Start, End, Result) :-
    Start =:= End,
    Result = [End].

range(Start, End, Result) :-
    Start =< End,
    NextStart is Start + 1,
    range(NextStart, End, Tail),
    Result = [Start | Tail].

combine(Xs, Ys, PXYs) :-
    combine1(Xs, Ys, PXYs).

combine1([], _, []).

combine1([X | Xs], Ys, PXYs0) :-
    combine1(Ys, X, PXYs0, PXYs1),
    combine1(Xs, Ys, PXYs1).

combine1([], _, A, A).

combine1([Y | Ys], X, [[X, Y] | D], E) :-
    combine1(Ys, X, D, E).

pair_products([], []).

pair_products([[A, B] | Rest], Products) :-
    P is A * B,
    pair_products(Rest, RestProducts),
    Products = [P | RestProducts].

main :-
    range(100, 999, Range),
    combine(Range, Range, Pairs),
    pair_products(Pairs, Products),
    filter_palindromes(Products, Palindromes),
    max_list(Palindromes, Max),
    write(Max),
    nl,
    halt.
