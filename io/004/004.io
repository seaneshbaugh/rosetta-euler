Sequence asList := method(
    result := list()

    self foreach(x,
        result append(x)
    )
)

palindromes := list()

x := 100

while(x < 1000,
    y := 100

    while(y < 1000,
        p := x * y

        if (p asString == p asString asList reverse map(c, c asCharacter) join,
             palindromes append(p)
        )

        y := y + 1
    )

    x := x + 1
)

write(palindromes max)

write("\n")
