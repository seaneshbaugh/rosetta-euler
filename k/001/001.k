/   !1000                               Monadic enumerate. Get a list of integers from 0 to 999.

/   (!1000)!/:3 5                       Dyadic modulo division of the previous applied over the list (3 5). Returns a list of two lists. The first being the result of each element in the previous mod 3 and the second being the result of each element in the previous mod 5.

/   &/(!1000)!/:3 5                     Dyadic min/and applied to the previous list of two lists. Returns a list of the minimum of each element in the first mod 3 and 5.

/   ~&/(!1000)!/:3 5                    Monadic not. Negates each element in the previous. In this case returns 1 in if the element is divisible by 3 or 5 and 0 if not.

/   &~&/(!1000)!/:3 5                   Monadic where. Gets the indices of the previous that are 1. In this case that is equivalent to the elements of the original list which are divisible by 3 or 5. This is a neat side effect of the list being integers starting with 0 up to a certain point. If it began elsewhere this would not work.

/   +/&~&/(!1000)!/:3 5                 Dyadic plus applied over the previous list. Sums the elements in the list.

/   5:+/&~&/(!1000)!/:3 5               Monadic printed representation. Converts result to string.

/   `0:5:+/&~&/(!1000)!/:3 5            Write to stdout.

`0:5:+/&~&/(!1000)!/:3 5

`0:"\n"

_exit(0)
