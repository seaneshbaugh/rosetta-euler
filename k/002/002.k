/   -2#x                                Monadic take. Get the last two elements of x.

/   +/-2#x                              Dyadic plus applied over the previous list. Sums the last two elements of x.

/   x,+/-2#x                            Append the previous to x.

/   (4e6>+/-2#){x,+/-2#x}/1             Apply the previous function while +/-2#x is less than 4000000. Use a list containing just 1 as the initial argument.

/   x!2                                 Dyadic modulo division. Returns a list of the result of each element in x mod 2. In this case 1 means not divisible by 2. 0 means divisible by 2.

/   ~x!2                                Monadic not. Negates each element in the previous. In this case returns 1 if the element is divisible by 2 and 0 if not.

/   &~x!2                               Monadic where. Gets the indices of the previous that are 1. In this case that is equivalent to the the indices of the elements of the original list which are sivisible by 2.

/   x@&~x!2                             Dyadic at. Returns the elements from x at the indices from the previous. In other words get only the even elements from x.

/   {x@&~x!2}(4e6>+/-2#){x,+/-2#x}/1    Fibonnaci numbers below 4000000 filtered to be only the evens.

/   +/{x@&~x!2}(4e6>+/-2#){x,+/-2#x}/1  Dyadic plus applied over the previous list. Sums the elements in the list.

+/{x@&~x!2}(4e6>+/-2#){x,+/-2#x}/1

_exit(0)