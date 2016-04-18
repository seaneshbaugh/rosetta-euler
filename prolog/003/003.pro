:- initialization(main).

prime_factors(N, Factors) :-
    prime_factors(N, 2, Factors).
prime_factors(N, P, Factors) :-
    N < P * P,
    Factors = [N].
prime_factors(N, P, Factors) :-
    N mod P =:= 0,
    R is N // P,
    prime_factors(R, P, Rest),
    Factors = [P | Rest].
prime_factors(N, P, Factors) :-
    NP is P + 1,
    prime_factors(N, NP, Factors).

list_max([Head], Head).
list_max([Head | Tail], Result) :-
    list_max(Tail, NextHead),
    Result is max(Head, NextHead).

main :-
    prime_factors(600851475143, Factors),
    list_max(Factors, Largest),
    write(Largest),
    nl,
    halt.
