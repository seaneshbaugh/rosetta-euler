let rec euler x =
    match x with
    | 1 -> 0
    | n when n % 3 = 0 || n % 5 = 0 -> n + euler(n - 1)
    | n -> euler(n - 1)

printf "%d\n" (euler(999))
