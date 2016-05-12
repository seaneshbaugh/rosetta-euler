GET "libhdr.h"

LET start() = VALOF
{
    LET sum = 0

    FOR i = 1 TO 999 DO
    {
        IF i REM 3 = 0 | i REM 5 = 0 DO
        {
            sum := sum + i
        }
    }

    writef("%i6*n", sum)

    RESULTIS 0
}