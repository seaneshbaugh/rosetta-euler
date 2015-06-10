class
    EULER

create
    make

feature
    make
        do
            euler
        end

    euler
        local
            sum: INTEGER
        do
            sum := 0

            across
                1 |..| 999 as c
            loop
                if c.item \\ 3 = 0 or c.item \\ 5 = 0 then
                    sum := sum + c.item
                end
            end

            io.put_string(sum.out + "%N")
        end
end