class
    EULER

create
    make

feature
    make
        local
            sum: INTEGER
            x: INTEGER
            y: INTEGER
            next: INTEGER
        do
            sum := 0

            from
                x := 0
                y := 1
            until
                x + y > 4000000
            loop
                next := x + y

                x := y

                y := next

                if next \\ 2 = 0 then
                   sum := sum + next
                end
            end

            io.put_string(sum.out + "%N")
        end
end
