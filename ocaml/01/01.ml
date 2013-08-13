let rec range i j = if i > j then [] else i :: (range (i + 1) j)

let sum = List.fold_left (+) 0

let answer = List.filter (fun x -> (x mod 3) = 0 || (x mod 5) = 0) (range 1 999);;

Printf.printf "%d\n" (sum answer)
