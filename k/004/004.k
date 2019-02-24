/   100+x                                  Dyadic plus. Add 100 to each element in x.

/   !900                                   Monadic enumerate. Returns a list of integers from 0 to 899.

/   {100+x}'!900                           Apply the above plus function to the above list to get a list of integers from 100 to 999.

/   g:{100+x}'!900                         Assign the above list of integers to variable g.

/   {x*g}'g:{100+x}'!900                   Dyadic multiply. Muliply each element in g by each element in g returning a list of lists of multiples for each element in g.

/   ,/{x*g}'g:{100+x}'!900                 Apply dyadic join to the above list of lists.

/   f:,/{x*g}'g:{100+x}'!900               Assign the above list of multiples to variable f.

/   $f:,/{x*g}'g:{100+x}'!900              Monadic format. Convert each element in the above list to strings.

/   |x                                     Monadic reverse. Reverses x, in this case as string.

/   x~|x                                   Dyadic match. In this case matches x with its reverse returning 1 if they're the same and 0 if not.

/   {x~|x}'$f:,/{x*g}'g:{100+x}'!900       Apply the above to the previous list of strings.

/   &{x~|x}'$f:,/{x*g}'g:{100+x}'!900      Monadic where. Gets the indices of the previous that are 1.

/   f@&{x~|x}'$f:,/{x*g}'g:{100+x}'!900    Dyadic at. Gets elements at the previous indices from variable f.

/   |/f@&{x~|x}'$f:,/{x*g}'g:{100+x}'!900  Dyadic max/or over the previous.

`0:5:|/f@&{x~|x}'$f:,/{x*g}'g:{100+x}'!900

`0:"\n"

_exit(0)
