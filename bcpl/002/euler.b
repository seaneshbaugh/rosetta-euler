GET "libhdr.h"

LET start() = VALOF
{
    LET sum = 0

    LET a = 0

    LET b = 1

    WHILE a + b < 4000000 DO
    {
        LET t = a + b

        a := b

        b := t

        IF t REM 2 = 0 DO sum := sum + t
    }

    writef("%i7*n", sum)

    RESULTIS 0
}