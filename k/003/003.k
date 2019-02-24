/   1+x                                                    Dyadic plus. Add 1 to each element in x.

/   !1+x                                                   Monadic enumerate. Returns a list of lists of integers, each starting at 0 and with one more element than the previous.
/                                                          e.g. for {!1+x}'!4
/
/                                                          (,0
/                                                           0 1
/                                                           0 1 2
/                                                           0 1 2 3)

/   x!'!1+x                                                Dyadic modulo division by each integer in x for each in the above. Returns a list of lists of integers, each being componsed of each element in x modulo the elements in the corresponding list above.
/                                                          e.g. for {x!'!1+x}'!4
/
/                                                          (0           <- 0 modulo 0
/                                                           1 0         <- 1 modulo 0, 1 modulo 1
/                                                           2 0 0       <- 2 modulo 0, 2 modulo 1, 2 modulo 2
/                                                           3 0 1 0)    <- 3 modulo 0, 3 modulo 1, 3 modulo 2, 3 modulo 3

/   ~x!'!1+x                                               Monadic not. Negates each element in the previous. In this case returns 1 if the element is divisible by the corresponding element in x and 0 if not.

/   &~x!'!1+x                                              Monadic where. Gets the indices of the previous that are 1. In this case that is equivalent of the elements of each list which are divisble by the corresponding element in x.

/   #&~x!'!1+x                                             Monadic count. Returns a list of the number of divisors found in each of the above.

/   2~#&~x!'!1+x                                           Dyadic match. Returns whether or not each element in x has only two divisors, thus making it be prime.

/   _sqrt x                                                Square root of x.

/   1+_sqrt x                                              Dyadic plus. Add 1 to the square root of x.

/   !1+_sqrt x                                             Monadic enumerate. Returns a list of integers from 0 to the square root of x.

/   x!'!1+_sqrt x                                          Dyadic modulo division of x by each inter in above.

/   {x!'!1+_sqrt x}600851475143                            Apply the above to 600851475143.

/   ~{x!'!1+_sqrt x}600851475143                           Monadic not. Negates each element in the previous. In this case returns 1 if the element is a factor of 600851475143 and 0 if not.

/   &~{x!'!1+_sqrt x}600851475143                          Monadic where. Gets the indices of the previous that are 1. In this case that is equivalent to getting the factor of 600851475143.

/   (f:&~{x!'!1+_sqrt x}600851475143)                      Assign the above list of divisors to variable f.

/   {2~#&~x!'!1+x}'(f:&~{x!'!1+_sqrt x}600851475143)       Apply the previously defined prime test to the factors of 600851475143. Returns 1 if prime and 0 if not.

/   &{2~#&~x!'!1+x}'(f:&~{x!'!1+_sqrt x}600851475143)      Monadic where. Gets the indices of the previous that previous that are 1.

/   f@&{2~#&~x!'!1+x}'(f:&~{x!'!1+_sqrt x}600851475143)    Dyadic at. Gets elements at the previous indices from variable f. Equivalent to the prime factors of 600851475143.

/   |/f@&{2~#&~x!'!1+x}'(f:&~{x!'!1+_sqrt x}600851475143)  Dyadic max/or over the previous.

`0:5:|/f@&{2~#&~x!'!1+x}'(f:&~{x!'!1+_sqrt x}600851475143)

`0:"\n"

_exit(0)
